package com.zmex.gc.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

public class Node {

  private final UUID nodeId = UUID.randomUUID();

  private final Node parentNode;

  private NodeType nodeType;

  private List<Node> relations;

  public Node(Node parentNode, NodeType nodeType) {
    this.parentNode = parentNode;
    this.nodeType = nodeType;
  }

  public UUID getNodeId() {
    return nodeId;
  }

  public NodeType getNodeType() {
    return nodeType;
  }

  public Node getParentNode() {
    return parentNode;
  }

  public List<Node> getRelations() {
    return relations;
  }

  public void addRelation(Node relation) {
    if (Objects.isNull(relations)) {
      relations = new ArrayList<>();
    }
    relations.add(relation);
  }
}
