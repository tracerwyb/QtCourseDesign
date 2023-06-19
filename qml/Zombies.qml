import QtQuick 2.15
import Felgo 3.0

EntityBase{
    id:zombie_normal
    width:100;  height: 130;

    property real blood: 4
    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;
        Image{
            source: "../assets/Zombies/NormalZombie/NormalZombie.gif"
            anchors.fill: parent
        }
    }
    BoxCollider {
      enabled: true
      x: 0
      y: 0
      density: 0
      friction: 0.4
      restitution: 0.4
      linearDamping: 100
      fixture.restitution: 0.5
      anchors.fill: parent

      fixture.onBeginContact: {
          var collidedEntity = other.getBody().target;
          var otherEntityId = collidedEntity.entityId;

          console.log("zombie",zombie_normal.x,zombie_normal.y)
          blood--;
          if(blood === 0){
              zombie_normal.destroy()
              blood = 4
          }

//                      if(otherEntityId.substring(0,4) === "rec1")
//               normal_zombie.destroy()
      }
    }

    // animate the bullet along its x-axis
//    NumberAnimation on x{
//        target: zombie_normal
//        to:100
//        running: true
//    }
}
