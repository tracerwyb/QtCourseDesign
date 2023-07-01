import QtQuick 2.15
import Felgo 3.0
import QtGraphicalEffects 1.0
/* normal zombie */
EntityBase{
    width:100;  height: 130;
    entityType: "zombie_normal"
    property real blood: 12
    id:zombie_normal
    /* Let zombie's head diappear after 2s*/
    Timer{
        id:dishead
        interval: 2000
        onTriggered: head.visible=false
        running: false
    }
    /* This timer destory zombies*/
    Timer{
        id:destoyentity
        interval: 500
        running: false
        onTriggered: removeEntity()
    }
    /* This timer let zombie return normal color after highlight*/
    Timer{
        id:high_return
        interval: 100
        onTriggered: hightlight.visible=false
    }
    /*This timer let zombie return normal color after darklight*/
    Timer{
        id:dark_return
        interval: 100
        onTriggered: darklight.visible=false
    }

    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;

        AnimatedImage{
            id: zombie_normal_img
            source: "../assets/Zombies/NormalZombie/NormalZombie.gif"
            //anchors.fill: parent
        }

        /* Hightlight let zombie have a effect that was hitted*/
        GammaAdjust{
            id:hightlight
            visible: false
            anchors.fill: zombie_normal_img
            source: zombie_normal_img
            gamma: 2.0
        }
        GammaAdjust{
            id:darklight
            visible: false
            anchors.fill: zombie_normal_img
            source: zombie_normal_img
            gamma: 0.4
        }
        AnimatedImage {
            id: head
            width: 150;height: 160
            visible: false
            playing: false
            source: "../assets/Zombies/NormalZombie/NormalZombieHead.gif"
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
      //bodyType: body.Static
      fixture.onBeginContact: {

          console.log("zombie was crashed")

          var collidedEntity = other.getBody().target;
          var otherEntityId = collidedEntity.entityId;
          if(otherEntityId.substring(0,4) === "pea_"){
              blood--;
              hightlight.visible=true
              high_return.start()
              console.log(blood)
          }
          if(blood === 0){

               zombie_normal.state="die"
          }
          if(otherEntityId.substring(0,8) === "potatoer")
          {
              blood=0
              removeEntity()
          }
          if(otherEntityId.substring(0,4) !== "pea_")
          {
              zombie_normal.state="attack"
          }
          if(otherEntityId.substring(0,10)==="cherrybomb")
          {
              zombie_normal.state="die_bomb"
          }

//          else if(otherEntityId.substring(0,8) !== "potatoer"){
//              if(potatoer.isStand === true){
//                  blood = 0
//                  zombie_normal.destroy()
//              }
          if(blood === 6 ){
              zombie_normal.state="losehead"
          }

      }
    }
    states: [
        State{
            name: "attack"
            PropertyChanges{target: zombie_normal_img; source: "../assets/Zombies/NormalZombie/NormalZombieAttack.gif"}
        },
        State {
           name: "losehead"
           PropertyChanges {target: zombie_normal_img; width:160;height:130;source:"../assets/Zombies/NormalZombie/NormalZombieLostHead.gif"}
           PropertyChanges {target: head; visible:true; playing:true}
           PropertyChanges {target: dishead;running:true}
            },
        State {
           name: "die"
           PropertyChanges {target: zombie_normal_img; width:160;height:130;source:"../assets/Zombies/NormalZombie/NormalZombieDie.gif"}
           PropertyChanges {target: destoyentity;running:true}
            },
        State {
           name: "die_bomb"
           PropertyChanges {target: zombie_normal_img; width:160;height:130;source:"../assets/Zombies/BoomDie1.gif"}
           PropertyChanges {target: destoyentity;running:true}
            }
        ]

}
