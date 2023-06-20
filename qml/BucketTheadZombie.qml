import QtQuick 2.15
import Felgo 3.0

/* normal zombie */
EntityBase{
    id:zombie_bucket
    width:100;  height: 130;

    property real blood: 4

//    property alias zombie_ani: zombie_ani

    Component.onCompleted: i++

    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;
        AnimatedImage{
            source: "../assets/Zombies/BucketheadZombie/BucketheadZombie.gif"
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

      fixture.onBeginContact: {
          var collidedEntity = other.getBody().target;
          var otherEntityId = collidedEntity.entityId;

          /* debug sentence */
          console.log("zombie",zombie_bucket.x,zombie_bucket.y)
          blood--;
          if(blood === 0){
              zombie_bucket.destroy()
              blood = 4
          }

          /*
             change zombies' action while detecting collider event,
             if the detected collider entity is a plant, blood reduce one
          */
          if(otherEntityId.substring(0,7) !== "zombie_"){
              normal_zombie.destroy()
          }
      }
    }

}
