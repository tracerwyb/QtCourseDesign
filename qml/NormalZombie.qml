import QtQuick 2.15
import Felgo 3.0

/* normal zombie */
EntityBase{
    id:zombie_normal

    width:100;  height: 130;
    entityType: "zombie_normal"
    property real blood: 20

    Timer{
        id:dishead
        interval: 2000
        onTriggered: head.visible=false
        running: false
    }
    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;

        AnimatedImage{
            id: zombie_normal_img
            source: "../assets/Zombies/NormalZombie/NormalZombie.gif"
            anchors.fill: parent
            AnimatedImage {
                width: 100;height: 100
                visible: false
                playing: false
                id: head
                source: "../assets/NormalZombieHead.gif"
            }
        }
    }

    NumberAnimation{
        id: back
        target: zombie_normal
        property: "x"
        to: zombie_normal.x+1
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
          console.log("zombie was crashed")
          var collidedEntity = other.getBody().target;
          var otherEntityId = collidedEntity.entityId;

          if(otherEntityId.substring(0,4) === "pea_"){
              blood--;
          } else{
              back.start()
          }
          if(blood === 0){
              zombie_normal.destroy()
          }
//              zombie_ani_0.start()
//          else if(otherEntityId.substring(0,8) !== "potatoer"){
//              if(potatoer.isStand === true){
//                  blood = 0
//                  zombie_normal.destroy()
//              }
          if(blood === 6 ){
              state="losehead"
          }
              console.log("potatoer")
//          }

          /*
             change zombies' action while detecting collider event,
             if the detected collider entity is a plant, blood reduce one
          */

          if(otherEntityId.substring(0,7) !== "zombie_"){
              zombie_normal.state === ''?zombie_normal.state = "attack" : zombie_normal.state = ''
          }
      }
    }
    states: [
        State{
            name: "attack"
            PropertyChanges{target: zombie_normal_img; source: "../assets/Zombies/NormalZombie/NormalZombieAttack.gif"}
        },
        State {
           name: "head"
           PropertyChanges {target: zombie_normal_img; width:80;height:80; source:"../assets/NormalZombieLostHead.gif"}
           PropertyChanges {target: head; visible:true; playing:true}
           PropertyChanges {target: dishead;running:true}
            }
        ]

}
