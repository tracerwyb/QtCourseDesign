import QtQuick 2.15
import Felgo 3.0

/* normal zombie */
EntityBase{
    id:zombie_flag
    width:100;  height: 130;

    property real blood: 4
    entityType: "zombie_flag"

    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;
        AnimatedImage{
            source: "../assets/Zombies/ConeheadZombie/ConeheadZombie.gif"
            anchors.fill: parent
        }
    }

    NumberAnimation{
        id: back
        target: zombie_flag
        property: "x"
        to: zombie_flag.x+1
        duration: 600
    }

    /*collider detecting*/
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
      categories: Box.Category2
      collidesWith: Box.Category1

      fixture.onBeginContact: {
          var collidedEntity = other.getBody().target;
          var otherEntityId = collidedEntity.entityId;

          if(otherEntityId.substring(0,4) === "pea_"){
              blood--;
          } else{
              back.start()
          }
          if(blood === 0){
              zombie_flag.destroy()
          }

          /*
             change zombies' action while detecting collider event,
             if the detected collider entity is a plant, blood reduce one
          */
      }
    }

}
