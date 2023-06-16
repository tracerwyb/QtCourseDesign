import Felgo 3.0
import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
EntityBase{
   entityType: "sunflower"
   anchors.fill: parent
   id:scene
/**
  This is a flower with sun,
  you can tap sun to collect it
 **/
   AnimatedImage{
       id:sunflower
       x:50; y:50
       source: "../assets/SunFlower.gif"

       AnimatedImage{
           anchors.bottomMargin: 30
           id:sun
           opacity: 0
           x:12;y:2
           source: "../assets/Sun.gif"
           width: 70;height: 70
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
                   PathCurve { x: 0; y: 40 }
               }
           }

//           YAnimator{
//               target: sun
//               id:yamimatior
//               from: 0
//               to:40
//               duration: 1000
//               running: true
//              // easing.type: Easing.InExpo
//           }
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
               onTapped: {
                  //huishou.running=true
                interval.start()
                disapper.running=true
              }
           }
       }
   }
}
