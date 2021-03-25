package com.zmex.collectors;

import java.util.ArrayList;
import java.util.List;

public class LoadUnit {

  private final List<Long> emulationWeight;

  public LoadUnit() {
    emulationWeight = new ArrayList<>();
    for (int i = 0; i < 100; i++) {
      emulationWeight.add(Long.MAX_VALUE);
    }
  }

  public List<Long> getEmulationWeight() {
    return emulationWeight;
  }
}
