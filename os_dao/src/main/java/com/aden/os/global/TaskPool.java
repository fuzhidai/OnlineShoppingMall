package com.aden.os.global;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

import static java.util.concurrent.Executors.*;

public class TaskPool{
    private volatile static TaskPool INSTANCE = null;

    private ThreadPoolExecutor executor;

    private TaskPool(){

        // int availProcessors = Runtime.getRuntime().availableProcessors();
        executor = (ThreadPoolExecutor) newFixedThreadPool(ThreadPoolUtil.ioIntesivePoolSize());
    }

    public static TaskPool getInstance() {

        // 防止不必要的程序执行
        if (INSTANCE == null) {
            // 使用同步块而不是同步方法来减少性能消耗
            synchronized (TaskPool.class) {
                // 再次判断 防止多线程下的重复创建对象
                if(INSTANCE == null) {
                    INSTANCE = new TaskPool();
                }
            }
        }
        return INSTANCE;
    }

    public ThreadPoolExecutor getExecutor() {
        return executor;
    }

    public void shutdown(){
        // do something
        // 这个方法等待线程池中所有已提交任务执行结束，不接收新任务，然后结束
        executor.shutdown();
        // 这个强制结束所有任务，然后正在等在的任务列表
        // executor.shutdownNow();
    }

    public void execute(Runnable command){
        // do something
        // 提交任务
        executor.execute(command);
    }

    public void status(){
        StringBuffer sb = new StringBuffer();
        // 当前正在执行任务的线程数
        sb.append(executor.getActiveCount() + "\n");
        // 当前正在等待执行的线程数
        sb.append(executor.getQueue().size() + "\n");
        // 返回已经完成的线程数
        sb.append(executor.getCompletedTaskCount() + "\n");
        System.out.println(sb.toString());
        // 注：以上方法都是返回一个大概值，因为线程在执行中，这些状态随时都会改变
    }
}