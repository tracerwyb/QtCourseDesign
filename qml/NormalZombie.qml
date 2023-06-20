import QtQuick 2.15
import Felgo 3.0

/* normal zombie */
EntityBase{
    width:100;  height: 130;
    entityType: "zombie_normal"
    property real blood: 12

//    property alias zombie_ani: zombie_ani

    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;
        AnimatedImage{
            id: zombie_normal_img
            source: "../assets/Zombies/NormalZombie/NormalZombie.gif"
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
          if(blood === 0){
              zombie_normal.destroy()
//              blood = 4
          }

          if(otherEntityId.substring(0,4) !== "pea_"){
              blood--;
          }else if(otherEntityId.substring(0,8) !== "potatoer"){
//              if(potatoer.isStand === true){
//                  blood = 0
//                  zombie_normal.destroy()
//              }
              console.log("potatoer")
          }

          /*
             change zombies' action while detecting collider event,
             if the detected collider entity is a plant, blood reduce one
          */

          if(otherEntityId.substring(0,7) !== "zombie_"){
              zombie_normal.state === ''?zombie_normal.state = "attack" : zombie_normal.state = ''
          }
      }
    }

    states: State{
        name: "attack"
        PropertyChanges{target: zombie_normal_img; source: "../assets/Zombies/NormalZombie/NormalZombieAttack.gif"}
    }
}
