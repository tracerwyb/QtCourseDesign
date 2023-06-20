import Felgo 3.0
import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
EntityBase{
   entityType: "sunflower"
   anchors.fill: parent
   id:scene
   visible: true
   width: sunflower.width
   height: sunflower.height
   //x:0;y:0
   //x:sunflower.x;y:sunflower.y
   toStoreProperties: ["lx", "ly"]
/**
  This is a flower with sun,
  you can tap sun to collect it
 **/
   AnimatedImage{
       id:sunflower
       width:70;height: 70
       //x:parent.x;y:parent.y
       x:200; y:200
       source: "../assets/SunFlower.gif"

       AnimatedImage{
           anchors.bottomMargin: 30
           id:sun
           opacity: 0
           x:12;y:2
           source: "../assets/Sun.gif"
          width:60;height: 60
           OpacityAnimator{
               id:disapper
               target: sun
               from: 1
               to:0
               duration: 2000
               running: false
          }
           OpacityAnimator{
               id:appear
               target: sun
               from: 0
               to:1
               duration: 1000
               running: false
          }
           PathAnimation{
               id:yamimatior
               target: sun
               duration: 2000
               path: Path{
                   PathCurve { x: 0; y: -30}
                   PathCurve { x: 0; y: 25 }
               }
           }

           Timer{
             id:suntimer
             interval: 15000
             running: true
             repeat: true
             onTriggered: {
              if(sun.opacity===1) {
                   disapper.running=true
             }
               else{
                  sun.x=0;sun.y=0
                  appear.running=true
                  yamimatior.start()

               }
             }
           }
           ParallelAnimation{
               id:huishou
               running: false

               NumberAnimation {
                   target: sun
                   property: "x"
                   to:-500
                   duration: 1000
                   easing.type: Easing.InOutQuad
               }
               NumberAnimation {
                   target: sun
                   property: "y"
                   to:-500
                   duration: 1000
                   easing.type: Easing.InOutQuad
               }
           }
           Timer{
               id:interval
               interval: 500
               onTriggered: huishou.running=true
           }

           TapHandler{
               target: sun
               onTapped: {
                  //huishou.running=true
                interval.start()
                disapper.running=true
                  // console.log(scene.parent)
              }
           }
       }
       TapHandler{
           id:hander
           onTapped:{
               console.log(hander.position)
               console.log(scene.entityId)}
       }

   }

   BoxCollider{
       enabled: true
       x: 0; y: 0
       density: 0
       friction: 0.4
       restitution: 0.4
       linearDamping: 100
       fixture.restitution: 0.5
       anchors.fill: parent
        width: 70;height: 70
       //bodyType: Body.Static

       // handle the collision
       fixture.onBeginContact: {
         var collidedEntity = other.getBody().target;
        console.log("this is flower was crashed")
         // check if it hit a player
         if (collidedEntity.isOfType("repeater")) {
             console.log("this is if repeater")
           // call damage method on playerRed or playerBlue
           collidedEntity.removeEntity()
         }
       }
   }
//    NumberAnimation{
//        target: x
//        duration: 1000
//    }
   function changexy(x,y){
       sunflower.x=x
       sunflower.y=y
   }
}

