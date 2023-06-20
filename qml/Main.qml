import Felgo 3.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.15

GameWindow{
    id:gameWindow

    property alias window: gameWindow
    property alias timer: timer         // timer that let cars animation start
    property alias carAni: carAni       // cars animation
    property alias scene: scene         // game scene

    property alias sun: scene.selSun    // selected plant: sunflower
    property alias pea: scene.selPea    // selected plant: peashooter
    property alias ptt: scene.selPtt    // selected plant: potato
    property alias repeate: scene.selRepeater   // selected plant: repeate peashooter
    property alias seedChooser: scene.seedChooser

    activeScene: welcome

    screenWidth: 1180
    screenHeight: 800

    Scne{
        id:scene
        anchors.fill: parent
        visible: false
    }

    Welcome{
        id:welcome
    }

    /* timer that let cars animation start */
    Timer{
        id:timer
        triggeredOnStart: false
        interval: 8000
        onTriggered: {
            scene.setCarHVisble();
            scene.carAnimation.start();
        }
    }

    /* cars animation */
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

    /* zombies start attack */
    Timer{
        id: zombie_timer
        interval:2000
        triggeredOnStart: false
        onTriggered:{
            scene.zombie_ani_0.start()
            scene.zombie_ani_1.start()
            scene.zombie_ani_2.start()
            scene.zombie_ani_3.start()
            scene.zombie_ani_4.start()
            scene.zombie_ani_5.start()
            scene.zombie_ani_6.start()
            scene.zombie_ani_7.start()
            scene.zombie_ani_8.start()

            console.log("timer triggered")
        }
    }
}








