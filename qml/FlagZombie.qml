import QtQuick 2.15
import Felgo 3.0
import QtGraphicalEffects 1.0

/* Flag zombie */
EntityBase{
    id:zombie_flag
    entityType: "zombie_flag"

    width:100;  height: 130;
    z:10

    property real blood: 14

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

    Timer{
        id: recover
        interval: 500
        onTriggered: zombie_flag.state="normal"
    }
    Rectangle{
        color: "#00ffffff"
        width:parent.width;  height: parent.height;
        AnimatedImage{
            id:zombie_flag_img
            source: "../assets/Zombies/FlagZombie/FlagZombie.gif"
            //anchors.fill: parent
        }
        GammaAdjust{
            id:hightlight
            visible: false
            anchors.fill: zombie_bucket_img
            source: zombie_bucket_img
            gamma: 2.0
        }
        GammaAdjust{
            id:darklight
            visible: false
            anchors.fill: zombie_bucket_img
            source: zombie_bucket_img
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
          console.log("flag zombie was crashed")

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
               zombie_flag.state="die"
          }
          if(otherEntityId.substring(0,8) === "potatoer")
          {
              removeEntity()
          }
          if(blood===8)
          {
              zombie_flag.state="losehead"
          }

          if(otherEntityId.substring(0,4) !== "pea_" && zombie_flag.blood > 8)
          {
              zombie_flag.state="attack"
              recover.start()
          }
          if(otherEntityId.substring(0,4) !== "pea_" && zombie_flag.blood < 8)
          {
              zombie_flag.state="attack_nohead"
              if(otherEntityId.blood===0)
              {
                  zombie_flag.state="losehead"
              }
          }
          if(otherEntityId.substring(0,4)==="boom")
          {
              zombie_flag.state="die_bomb"
          }
          if(otherEntityId.substring(0,3)==="car"){
                removeEntity()
          }
      }
    }
    states: [
        State{
            name:"normal"
            PropertyChanges{target:zombie_flag_img;source:"../assets/Zombies/FlagZombie/FlagZombie.gif"}
        },
        State{
            name: "attack"
            PropertyChanges{target: zombie_flag_img; source: "../assets/Zombies/FlagZombie/FlagZombieAttack.gif"}
        },
        State{
            name: "attack_nohead"
            PropertyChanges{target: zombie_flag_img;width:160;height:130; source: "../assets/Zombies/FlagZombieLostHeadAttack.gif"}
        },
        State {
           name: "losehead"
           PropertyChanges {target: zombie_flag_img; width:160;height:130;source:"../assets/Zombies/FlagZombie/FlagZombieLostHead.gif"}
           PropertyChanges {target: head; visible:true; playing:true}
           PropertyChanges {target: dishead;running:true}
            },
        State {
           name: "die"
           PropertyChanges {target: zombie_flag_img; width:160;height:130;source:"../assets/Zombies/NormalZombie/NormalZombieDie.gif"}
           PropertyChanges {target: destoyentity;running:true}
            },
        State {
           name: "die_bomb"
           PropertyChanges {target: zombie_flag_img; width:160;height:130;source:"../assets/Zombies/BoomDie1.gif"}
           PropertyChanges {target: destoyentity;running:true}
            }
        ]
}
