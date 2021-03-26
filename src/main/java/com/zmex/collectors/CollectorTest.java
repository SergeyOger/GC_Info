package com.zmex.collectors;

import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.List;

public class CollectorTest {

  public static void main(String[] args) {

    final long executionStartTime = System.currentTimeMillis();

    List<LoadUnit> oldGenerationCandidates = new ArrayList<>();
    for (int i = 0; i < 1000; i++) {
      if (i % 50 == 0) {
        oldGenerationCandidates.addAll(performLoad());
      } else {
        performLoad();
      }
    }

    final long executionEndTime = System.currentTimeMillis();

    final List<GarbageCollectorMXBean> gcBeans = ManagementFactory
        .getGarbageCollectorMXBeans();

    final long gcExecutionTime = gcBeans.stream().map(GarbageCollectorMXBean::getCollectionTime)
        .reduce(0L, Long::sum);

    final long gcIterationsCount = gcBeans.stream().map(GarbageCollectorMXBean::getCollectionCount)
        .reduce(0L, Long::sum);

    final long executionTime = executionEndTime - executionStartTime;

    final double payloadPercentage
        = (100 - (((double) gcExecutionTime / (double) executionTime) * 100));

    System.out.println("-------------------------------------------------------------------------");
    System.out.println("Total execution time: " + executionTime + " milliseconds");
    System.out.println("GC execution time: " + gcExecutionTime + " milliseconds");
    System.out.println("GC iterations: " + gcIterationsCount);
    System.out.println("Throughput: " + Math.round(payloadPercentage * 100) / 100 + " %");
    System.out.println("-------------------------------------------------------------------------");
  }

  private static List<LoadUnit> performLoad() {
    List<LoadUnit> oldGenerationCandidates = new ArrayList<>();
    for (int i = 0; i < 10000; i++) {
      oldGenerationCandidates.add(new LoadUnit());
    }

    return oldGenerationCandidates;
  }
}
