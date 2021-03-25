package com.zmex.collectors;

import java.util.UUID;

public class LoadUnit {

  private UUID unitId = UUID.randomUUID();

  public UUID getUnitId() {
    return unitId;
  }

  public void setUnitId(UUID unitId) {
    this.unitId = unitId;
  }
}
