package com.example.demo.service;

import org.springframework.stereotype.Service;

@Service
public class BenchmarkService {

    public long runBenchmark(Runnable task) {
        long startTime = System.nanoTime();
        task.run();
        return System.nanoTime() - startTime;
    }
}
