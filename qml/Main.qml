import Felgo 3.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.15
GameWindow{
    id:gameWindow
    property alias window: gameWindow
    property alias timer: timer
    property alias carAni: carAni
    property alias scene: scene
    activeScene: welcome

    screenWidth: 1180
    screenHeight: 800

    Welcome{
        id:welcome

    }
    SelectPlants{
        id:scene
        anchors.fill: parent

    }

     TapHandler{
         onTapped: {
             scene.startAnimation.start();
             timer.start()
             carAni.start()
         }
     }

    Timer{
        id:timer
        triggeredOnStart: false
        interval: 8000
        onTriggered: {
            scene.setCarHVisble();
            scene.carAnimation.start();
        }
    }

    Timer{
        id:carAni
        triggeredOnStart: false
        interval: 9000
        onTriggered: {
            scene.setCarHDisable();
            scene.seledPlantVis = true;
            scene.choseVis = true;
        }
    }
}








