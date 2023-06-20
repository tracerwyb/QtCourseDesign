import QtQuick 2.15
import Felgo 3.0

/* normal zombie */
EntityBase{
    id:zombie_cone
    width:100;  height: 130;

    property real blood: 4

//    property alias zombie_ani: zombie_ani


    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;
        AnimatedImage{
            source: "../assets/Zombies/ConeheadZombie/ConeheadZombie.gif"
            anchors.fill: parent
        }
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

          /* debug sentence */
          console.log("zombie",zombie_bucket.x,zombie_bucket.y)
          blood--;
          if(blood === 0){
              zombie_cone.destroy()
              blood = 4
          }

          /*
             change zombies' action while detecting collider event,
             if the detected collider entity is a plant, blood reduce one
          */
      }
    }

}
