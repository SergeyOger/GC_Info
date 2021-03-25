package com.zmex.collectors;

import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryPoolMXBean;
import java.util.List;

public class CollectorTest {

  public static void main(String[] args) {

    performLoad();

    final List<GarbageCollectorMXBean> gcBeans = ManagementFactory
        .getGarbageCollectorMXBeans();

    final long gcExecutionTime = gcBeans.stream().map(GarbageCollectorMXBean::getCollectionTime)
        .reduce(0L, Long::sum);

    final long gcIterationsCount = gcBeans.stream().map(GarbageCollectorMXBean::getCollectionCount)
        .reduce(0L, Long::sum);
    System.out.println("-------------------------------------------------------------------------");
    System.out.println("GC execution time: " + gcExecutionTime + " milliseconds");
    System.out.println("GC iterations: " + gcIterationsCount);
    System.out.println("-------------------------------------------------------------------------");

    System.out.println("Memory allocation statistic");
    final List<MemoryPoolMXBean> memoryManagerMXBeans = ManagementFactory
        .getMemoryPoolMXBeans();

    memoryManagerMXBeans.forEach(memoryPoolMXBean -> {
      System.out.println(memoryPoolMXBean.getUsage());
    });
  }

  private static void performLoad() {
    for (int i = 0; i < 10000000; i++) {
      new LoadUnit();
    }
  }
}
