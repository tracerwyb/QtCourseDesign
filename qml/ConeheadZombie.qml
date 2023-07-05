import QtQuick 2.15
import Felgo 3.0
import QtGraphicalEffects 1.0

/* conehead zombie */
EntityBase{
    id:zombie_cone
    entityType: "zombie_cone"

    width:100;  height: 130;
    z:10
    property real blood: 15

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
        onTriggered: removeentity()
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

    Timer{
        id: recover
        interval: 500
        onTriggered: zombie_cone.state="normal_cone"
    }
    Timer{
        id: recover_normal_nohead
        interval: 500
        onTriggered:zombie_cone.state="losehead_go"
    }
    Timer{
        id: recover_normal
        interval: 500
        onTriggered:zombie_cone.state="normal"
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
        duration: 2000
    }
    function removeentity(){
        zombiedie++;
        secondWave();
        removeEntity();
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
      collidesWith: Box.Category1|Box.Category3
      Timer{
          id:remove
          interval: 500
          onTriggered: removeentity()
      }
      fixture.onBeginContact: {
          var collidedEntity = other.getBody().target;
          var otherEntityId = collidedEntity.entityId;
          if(otherEntityId.substring(0,4) === "pea_"){
              blood--;
              hightlight.visible=true
              high_return.start()
        }
         else if(otherEntityId.substring(0,4)!=="wall"){
             back.start()
          }
          if(blood === 0){
              zombie_cone.state="die"
          }
          if(otherEntityId.substring(0,8) === "potatoer"){
              removeentity()
          }
          if(blood===12){
              zombie_cone.state="normal"
          }

          if(otherEntityId.substring(0,4) !== "pea_"&& otherEntityId.substring(0,4)!=="wall" && zombie_cone.blood > 12)
          {
              zombie_cone.state="attack_cone"
              recover.start()
          }
          if(otherEntityId.substring(0,4) !== "pea_"&& otherEntityId.substring(0,4)!=="wall" && zombie_cone.blood <= 12 && zombie_cone.blood>6)
          {
              zombie_cone.state="attack"
              recover_normal.start()
          }
          if(blood === 6 ){
              zombie_cone.state="losehead"
          }
          if(otherEntityId.substring(0,4) !== "pea_"&& otherEntityId.substring(0,4)!=="wall"&& zombie_cone.blood < 6)
          {
              zombie_cone.state="attack_losehead"
             recover_normal_nohead.start()
          }
          if(otherEntityId.substring(0,4)==="boom")
          {
              blood=-1
              zombie_cone.state="die_bomb"
              remove.start()
          }
          if(otherEntityId.substring(0,3)==="car"){
              removeentity()
          }
          console.log("zokmbiedie",zombiedie)
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
            PropertyChanges{target: zombie_cone_img;width:160;height:130; source: "../assets/Zombies/NormalZombie/NormalZombieLostHeadAttack.gif"}
        },
        State {
           name: "losehead"
           PropertyChanges {target: zombie_cone_img; width:160;height:130;source:"../assets/Zombies/NormalZombie/NormalZombieLostHead.gif"}
           PropertyChanges {target: head; visible:true; playing:true}
           PropertyChanges {target: dishead;running:true}
            },
        State{
            name: "losehead_go"
            PropertyChanges{target: zombie_cone_img;width:160;height:130; source: "../assets/Zombies/NormalZombie/NormalZombieLostHead.gif"}
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
