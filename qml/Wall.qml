import QtQuick 2.0
import Felgo 3.0

EntityBase {
  entityType: "wall"
  // default width and height
  width: 1
  height: 220
  Image {
      anchors.fill: parent
      id: img
      source: "../assets/felgo-logo.png"
  }
  // only collider since we want the wall to be invisible
//  BoxCollider {
//    categories:Box.Category3
//    collidesWith: Box.Category1 |Box.Category2
//    anchors.fill: parent
//    bodyType: Body.Static // the body shouldn't move
//    fixture.onBeginContact: {
//        console.log("this is wall")
//    }
//  }
}
