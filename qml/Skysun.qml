import QtQuick 2.15
import Felgo 3.0

EntityBase {
    id:entity
  entityType: "skysun"
  width: skysun.width
  height: skysun.height
  AnimatedImage{
      opacity: 1
      id:skysun
      source: "../assets/Sun.gif"
      width: 35
      height: 35
      OpacityAnimator{
          id:showskysun
          target: skysun
          from: 0
          to:1
          duration: 1000
          running: false
      }
      OpacityAnimator{
          id:disshow
          target: skysun
          from: 1
          to:0
          duration: 1000
          running: false
      }

      }
      ParallelAnimation{
          id:skyhuishou
          running: false

          NumberAnimation {
              target: skysun
              property: "x"
              to:0-x-parent.x-20
              duration: 1000
              easing.type: Easing.InOutQuad
          }
          NumberAnimation {
              target: skysun
              property: "y"
              to:0-y-parent.y-20
              duration: 1000
              easing.type: Easing.InOutQuad
          }
      }

  CircleCollider {
        id:skysuncollider
  }
 TapHandler{
     target: skysun
     onTapped: {console.log("press")
         disshow.running=true;skyhuishou.running=true
         console.log(entity.parent.objectName)

     }
 }
  Component.onCompleted: {
    x = utils.generateRandomValueBetween(0,scene.width-skysun.width)
    y = 0
  }
  Behavior on y{
      NumberAnimation {
          duration: 5000
      }
  }
/**
  Let skysun fall on the random position
 **/
  Timer{
      id:setposition
      running:true
      onTriggered: {
          y=utils.generateRandomValueBetween(100,scene.height-skysun.height)
      }
  }
/**
  If for a long time no one collect the falled skysun
  this timer will let it disappear
 **/
  Timer{
      id:diasappertimer
      running:true
      interval: 15000
      onTriggered: disshow.running=true
  }
}
