package com.aden.os.biz.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Date;

public class CommodityJob implements Job {

    public void onShelves(){
        System.out.println("Job："+ new Date().toString());
    }

    public void execute() {
        System.out.println("Quartz Spring XML 配置 - MyJob");
    }

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        System.out.println("Quartz Spring XML 配置 - MyJob");
    }
}