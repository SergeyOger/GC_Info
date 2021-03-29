package com.zmex.gc;

import static com.zmex.gc.model.NodeType.CHILD;
import static com.zmex.gc.model.NodeType.ROOT;

import com.zmex.gc.model.Node;

public class App {


  public static void main(String[] args) {
    Node rootNode = new Node(null, ROOT);

    for (int i = 0; i < 20; i++) {
      rootNode.addRelation(new Node(rootNode, CHILD));
    }
  }
}
