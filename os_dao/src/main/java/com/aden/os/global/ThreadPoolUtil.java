package com.aden.os.global;

public final class ThreadPoolUtil {

    private ThreadPoolUtil() {

    }
    /**
     * Each tasks blocks 90% of the time, and works only 10% of its
     *  lifetime. That is, I/O intensive pool
     * @return io intesive Thread pool size
     */
    public static int ioIntesivePoolSize() {

        double blockingCoefficient = 0.9;
        return poolSize(blockingCoefficient);
    }

    /**
     *
     * Number of threads = Number of Available Cores / (1 - Blocking
     * Coefficient) where the blocking coefficient is between 0 and 1.
     *
     * A computation-intensive task has a blocking coefficient of 0, whereas an
     * IO-intensive task has a value close to 1,
     * so we don't have to worry about the value reaching 1.
     *  @param blockingCoefficient the coefficient
     *  @return Thread pool size
     */
    public static int poolSize(double blockingCoefficient) {
        int numberOfCores = Runtime.getRuntime().availableProcessors();
        int poolSize = (int) (numberOfCores / (1 - blockingCoefficient));
        return poolSize;
    }
}