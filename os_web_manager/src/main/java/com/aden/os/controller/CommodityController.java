package com.aden.os.controller;

import com.aden.os.biz.CommodityBiz;
import com.aden.os.biz.CommodityCategoryBiz;
import com.aden.os.biz.producer.FileUploadProducer;
import com.aden.os.dto.CommodityForm;
import com.aden.os.entity.Commodity;
import com.aden.os.entity.CommodityCategory;
import com.aden.os.global.TaskPool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

@Controller
@RequestMapping("/backstage/commodity")
public class CommodityController {

    @Autowired
    private CommodityBiz commodityBiz;
    @Autowired
    private CommodityCategoryBiz commodityCategoryBiz;
    @Autowired
    private FileUploadProducer fileUploadProducer;

    private final ThreadPoolExecutor executor = TaskPool.getInstance().getExecutor();

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> model){
        model.put("TYPE", "add");
        model.put("TYPES", commodityCategoryBiz.getAll());
        return "commodity_add";
    }

    @RequestMapping("/{type}/detail/{id}")
    public String detail(@PathVariable("id")Integer id, @PathVariable("type")String type, Map<String, Object> model){
        model.put("TYPE", type);
        model.put("DETAIL", commodityBiz.getDetailFromCache(id));
        return "commodity_detail";
    }

    @RequestMapping("/{type}/to_edit/{id}")
    public String toEdit(@PathVariable("id")Integer id, @PathVariable("type")String type, Map<String, Object> model){
        model.put("TYPE", type);
        model.put("TYPES", commodityCategoryBiz.getAll());
        model.put("DETAIL", commodityBiz.getDetailFromCache(id));
        return "commodity_edit";
    }

    @RequestMapping("/add")
    public String add(CommodityForm commodityForm){
        commodityBiz.add(transformCommodityFormToCommodity(commodityForm));
        return "commodity_add";
    }

    @RequestMapping("/edit")
    public String edit(CommodityForm commodityForm){
        commodityBiz.edit(transformCommodityFormToCommodity(commodityForm));
        return "commodity_edit";
    }

    @RequestMapping("/upload")
    public String upload(final MultipartFile image, Integer commodityId, String type, final Map<String, Object> model){

        model.put("TYPE", type);
        model.put("TYPES", commodityCategoryBiz.getAll());

        if (!"add".equals(type)){

            if (image != null){
                Commodity commodity = commodityBiz.get(commodityId);
                String storePath = storePic(image);
                commodity.setImage(storePath);
                commodityBiz.edit(commodity);
            }

            model.put("DETAIL", commodityBiz.getDetailFromCache(commodityId));
            return "commodity_edit";
        }else{

            // 新开线程进行图像文件的存储
            executor.execute(new Runnable() {
                @Override
                public void run() {
                    String storePath = storePic(image);
                    model.put("PIC_PATH", storePath);
                }
            });
            return "commodity_add";
        }
    }

    @RequestMapping("/{status}/change_status/{id}")
    public String changeStatus(@PathVariable("id")Integer id, @PathVariable("status")String status, Map<String, Object> model){
        model.put("TYPE", status);
        commodityBiz.changeStatus(id);
        model.put("LIST", commodityBiz.getByStatus(status));
        return "commodity_list";
    }

    @RequestMapping("/list/{status}")
    public String list(@PathVariable("status")String status){
        return "redirect:" + status + "/1";
    }

    @RequestMapping("/list/{status}/{index}")
    public String list(@PathVariable("status")String status, @PathVariable("index")Integer index, Map<String, Object> model){

        Page<?> page = PageHelper.startPage(index, 10);
        List<Commodity> commodities = commodityBiz.getByStatus(status);
        PageInfo<?> pageInfo = page.toPageInfo();

        model.put("LIST", commodities);
        model.put("INFO", pageInfo);
        model.put("TYPE", status);
        return "commodity_list";
    }


    private String storePic(MultipartFile image){

        // 原始名称
        String originalFileName = image.getOriginalFilename();
        // 上传图片
        if(originalFileName != null && originalFileName.length() > 0){
            // 获取当天日期
            Calendar calendar = Calendar.getInstance();
            // 存储图片的物理路径
            String picPath = "D:\\pic\\" + calendar.get(Calendar.YEAR) + "\\" + (calendar.get(Calendar.MONTH)+1) + "\\" + calendar.get(Calendar.DATE) + "\\";
            // 新的图片名称
            String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
            // 新图片
            File newFile = new File(picPath + newFileName);

            // 拼接图片路径格式：2019\6\29\0215a99e-5530-4c04-88ca-7a0232443261.png
            String storeName = picPath.substring(picPath.indexOf("\\") + 1);
            storeName = storeName.substring(storeName.indexOf("\\") + 1) + newFileName;
            // System.out.println(storeName);

            try {
                // 将内存中的数据写入磁盘
                image.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            return storeName;
        }

        return null;
    }

    private Commodity transformCommodityFormToCommodity(CommodityForm commodityForm){
        Commodity commodity = new Commodity();
        commodity.setName(commodityForm.getName());
        commodity.setTypeId(commodityForm.getTypeId());
        commodity.setPrice(commodityForm.getPrice());
        commodity.setStock(commodityForm.getStock());
        commodity.setStatus(commodityForm.getStatus());
        commodity.setImage(commodityForm.getImage());
        commodity.setIntroduction(commodityForm.getIntroduction());
        commodity.setDetailedIntroduction(commodityForm.getDetailedIntroduction());

        // 修改商品信息情况下 id不为空
        if (commodityForm.getId() != null){
            commodity.setId(commodityForm.getId());
        }

        if (commodityForm.getAddedTime() != null){
            // 将字符串格式的时间转化为 Date
            String dateStr = commodityForm.getAddedTime();
            try {
                Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(dateStr.replace("T"," "));
                commodity.setAddedTime(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        return commodity;
    }
}
