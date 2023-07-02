import QtQuick 2.15
import Felgo 3.0
import QtGraphicalEffects 1.0

/* conehead zombie */
EntityBase{
    id:zombie_cone
    width:100;  height: 130;
    property real blood: 15
    entityType: "zombie_cone"

//    property alias zombie_ani: zombie_ani
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
        interval: 1000
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
            id:zombie_cone_img
            source: "../assets/Zombies/ConeheadZombie/ConeheadZombie.gif"
           // anchors.fill: parent
        }
        /* Hightlight let zombie have a effect that was hitted*/
        GammaAdjust{
            id:hightlight
            visible: false
            anchors.fill: zombie_cone_img
            source: zombie_cone_img
            gamma: 2.0
        }
        GammaAdjust{
            id:darklight
            visible: false
            anchors.fill: zombie_cone_img
            source: zombie_cone_img
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
    NumberAnimation{
        id: back
        target: zombie_cone
        property: "x"
        to: zombie_cone.x+1
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
              hightlight.visible=true
              high_return.start()
              console.log(blood)
        }
         else{
             back.start()
          }
          if(blood === 0){
               zombie_cone.state="die"
          }
          if(otherEntityId.substring(0,8) === "potatoer")
          {
              removeEntity()
          }
          if(blood===12)
          {
              zombie_cone.state="normal"
          }

          if(otherEntityId.substring(0,4) !== "pea_" && zombie_cone.blood > 12)
          {
              zombie_cone.state="attack_cone"
              if(otherEntityId.blood === 0)
              {
                  zombie_cone.state="normal_cone"
              }
          }
          if(otherEntityId.substring(0,4) !== "pea_" && zombie_cone.blood <= 12 && zombie_cone.blood>6)
          {
              zombie_bucket.state="attack"
              if(otherEntityId.blood === 0)
              {
                  zombie_cone.state="normal"
              }
          }
//          else if(otherEntityId.substring(0,8) !== "potatoer"){
//              if(potatoer.isStand === true){
//                  blood = 0
//                  zombie_normal.destroy()
//              }
          if(blood === 6 ){
              zombie_cone.state="losehead"
          }
          if(otherEntityId.substring(0,4) !== "pea_"&& zombie_cone.blood < 6)
          {
              zombie_cone.state="attack_losehead"
              if(otherEntityId.blood === 0)
              {
                  zombie_cone.state="losehead"
              }
          }
          if(otherEntityId.substring(0,10)==="cherrybomb")
          {
              zombie_cone.state="die_bomb"
          }
      }
    }
    states: [
        State{
            name:"normal_cone"
            PropertyChanges{target:zombie_cone_img;source:"../assets/Zombies/ConeheadZombie/ConeheadZombie.gif"}
        },
        State{
            name: "attack_cone"
            PropertyChanges{target: zombie_cone_img; source: "../assets/Zombies/ConeheadZombie/ConeheadZombieAttack.gif"}
        },
        State{
            name:"normal"
            PropertyChanges{target:zombie_cone_img;source:"../assets/Zombies/NormalZombie/NormalZombie.gif"}
        },
        State{
            name: "attack"
            PropertyChanges{target: zombie_cone_img; source: "../assets/Zombies/NormalZombie/NormalZombieAttack.gif"}
        },
        State{
            name: "attack_losehead"
            PropertyChanges{target: zombie_bucket_img;width:160;height:130; source: "../assets/Zombies/NormalZombie/NormalZombieLostHeadAttack.gif"}
        },
        State {
           name: "losehead"
           PropertyChanges {target: zombie_cone_img; width:160;height:130;source:"../assets/Zombies/NormalZombie/NormalZombieLostHead.gif"}
           PropertyChanges {target: head; visible:true; playing:true}
           PropertyChanges {target: dishead;running:true}
            },
        State {
           name: "die"
           PropertyChanges {target: zombie_cone_img; width:160;height:130;source:"../assets/Zombies/NormalZombie/NormalZombieDie.gif"}
           PropertyChanges {target: destoyentity;running:true}
            }
        ,
        State {
           name: "die_bomb"
           PropertyChanges {target: zombie_cone_img; width:160;height:130;source:"../assets/Zombies/BoomDie1.gif"}
           PropertyChanges {target: destoyentity;running:true}
            }
        ]
}
