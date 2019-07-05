package com.aden.os.biz.impl;

import com.aden.os.biz.CommodityBiz;
import com.aden.os.biz.job.CommodityShelvesJob;
import com.aden.os.dao.CommodityDao;
import com.aden.os.entity.Commodity;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("commodityBiz")
public class CommodityBizImpl implements CommodityBiz {

    private List<Commodity> cache;

    private final CommodityDao commodityDao;

    @Autowired(required=false)
    private SchedulerFactoryBean schedulerFactoryBean;

    private static final String REDIS_CART = "commodity";

    public CommodityBizImpl(CommodityDao commodityDao) {
        this.commodityDao = commodityDao;
    }

    @CachePut(value = "redisCacheManager", key = "'commodity:'+#commodity.id")
    public Commodity add(Commodity commodity) {
        commodity.setCreateTime(new Date());
        commodity.setUpdateTime(new Date());

        // 若未设置上架时间则为立即上架，否则为定时上架
        if (commodity.getAddedTime() == null){
            commodity.setAddedTime(new Date());
        }else {
            Date date = new Date();

            // 如果当前时间已经晚于或刚好为定时上架时间则直接上架商品
            if (date.compareTo(commodity.getAddedTime()) >= 0){
                commodity.setStatus("in_stock");
            }else{

                SimpleDateFormat formatter = new SimpleDateFormat("0 m H d M ? yyyy");
                String cronExpressionString = formatter.format(commodity.getAddedTime());

                System.out.println("cronExpressionString: " + cronExpressionString);

                // 启动定时上架任务
                startCommodityShelvesJob(commodity.getId(), cronExpressionString);
            }
        }

        commodity.setSalesVolume(0);
        commodityDao.insert(commodity);
        return commodity;
    }

    public void setCache(List<Commodity> cache) {
        this.cache = cache;
    }

    @CachePut(value = "redisCacheManager", key = "'commodity:'+#commodity.id")
    public Commodity edit(Commodity commodity) {
        commodity.setUpdateTime(new Date());
        commodityDao.update(commodity);
        return commodity;
    }

    @CachePut(value = "redisCacheManager", key = "'commodity:'+#id")
    public Commodity changeStatus(Integer id) {
        Commodity commodity = getDetailFromCache(id);
        commodity.setAddedTime(new Date());
        commodity.setUpdateTime(new Date());

        if ("in_stock".equals(commodity.getStatus())){
            commodity.setStatus("for_sale");
        }else if ("for_sale".equals(commodity.getStatus())){
            commodity.setStatus("in_stock");
        }
        commodityDao.update(commodity);
        return commodity;
    }

    @Override
    @CachePut(value = "redisCacheManager", key = "'commodity:'+#id")
    public Commodity inStockCommodity(Integer id) {
        Commodity commodity = commodityDao.select(id);
        commodity.setUpdateTime(commodity.getAddedTime());
        commodity.setStatus("in_stock");
        commodityDao.update(commodity);
        return commodity;
    }

    @CacheEvict(value = "redisCacheManager", key = "'commodity:'+#id")
    public void remove(Integer id) {
        commodityDao.delete(id);
    }

    @Cacheable(value = "redisCacheManager", key = "'commodity:'+#id")
    public Commodity get(Integer id) {
        return commodityDao.select(id);
    }

    public List<Commodity> getEveryTypeTopThree(){
        cache = commodityDao.selectEveryTypeTopThree();
        return cache;
    }

    @Override
    public List<Commodity> getSalesVolumeTopTen() {
        cache = commodityDao.selectSalesVolumeTopTen();
        return cache;
    }

    public List<Commodity> getByType(Integer typeId) {
        cache = commodityDao.selectByType(typeId);
        return cache;
    }

    public List<Commodity> getByStatus(String status){

        if ("all".equals(status)){
            return getAll();
        }else{
            cache = commodityDao.selectByStatus(status);
            return cache;
        }
    }

    public Commodity getDetailFromCache(Integer id){

        if (cache == null){
            getAll();
        }

        for (Commodity commodity : cache) {
            if (commodity.getId() == id.intValue()) {
                return commodity;
            }
        }
        return null;
    }

    public List<Commodity> getAll() {
        cache = commodityDao.selectAll();
        return cache;
    }

    private void startCommodityShelvesJob(Integer commodityId, String cronExpressionString){

        try {
            JobDetail jobDetail = JobBuilder.newJob(CommodityShelvesJob.class).build();
            jobDetail.getJobDataMap().put("commodityId", commodityId);

            CronExpression cronExpression = null;
            cronExpression = new CronExpression(cronExpressionString);
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression);
            Trigger trigger = TriggerBuilder.newTrigger().withSchedule(scheduleBuilder).build();

            Scheduler scheduler = schedulerFactoryBean.getScheduler();
            scheduler.scheduleJob(jobDetail, trigger);

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
