package com.aden.os.biz.job;

import com.aden.os.biz.impl.CommodityBizImpl;
import com.aden.os.dao.CommodityDao;
import com.aden.os.entity.Commodity;
import org.omg.PortableInterceptor.INACTIVE;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;

import java.util.Date;

@DisallowConcurrentExecution
public class CommodityShelvesJob implements Job {

    @Autowired
    private CommodityBizImpl commodityBiz;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        Integer commodityId = (Integer) jobExecutionContext.getJobDetail().getJobDataMap().get("commodityId");
        commodityBiz.inStockCommodity(commodityId);
    }
}