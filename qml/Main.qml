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
    property alias entityManager: entityManager

    property alias sun: scene.selSun    // selected plant: sunflower
    property alias pea: scene.selPea    // selected plant: peashooter
    property alias ptt: scene.selPtt    // selected plant: potato
    property alias repeate: scene.selRepeater   // selected plant: repeate peashooter
    property alias seedChooser: scene.seedChooser
    property bool skysunfall: false    //when game begin make it true
    property alias wallnut: scene.selWallNut
    property alias cherryBomb: scene.selcherryBomb
    property alias snowpeashooter: scene.selsnowpeashooter
    property alias shovel: scene.selShovel

    property real zombiedie: 0      // record the number of zombies that have died
    property bool peatf: false
    property real plantnumber: 0     //Preventing duplicate planting of plants in the same location
    property real totalsun: 50    //Counter, used to buy the sun for plants

    property double screnH: screenHeight - 30
    activeScene: welcome

    screenWidth: 1180
    screenHeight: 800

    function secondWave(){
        if(zombiedie===10){
            swTextVis.start()
            swTextDis.start()
            zombie_timer2.start()
        }
        if(zombiedie===20){
            gameFial.source = "../assets/interface/Succeed.png"
            gameFial.visible = true
        }
    }

    Text{
        text:zombiedie
        font.pixelSize: 40
        anchors.centerIn: parent
        color:"black"
    }

    /* the game begin scene */
    Scne{
        id:scene
        anchors.fill: parent
        visible: false
        PhysicsWorld{}
        //a timer create sun let the sun in sky fall random
        Timer{
            id:createskytimer
            running: skysunfall
            repeat: true
            interval: 5000
            onTriggered: entityManager.createEntityFromUrl(Qt.resolvedUrl("Skysun.qml"));
        }
    }
    /* the start scene*/
    Welcome{
        id:welcome
    }

    /* timer that let cars' animation start */
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
        interval:8000
        triggeredOnStart: false
        onTriggered:{
            scene.zombie_ani_3.start()
            zombie_timer_01.start()
        }
    }
    Timer{
        id: zombie_timer_01
        interval:14000
        triggeredOnStart: false
        onTriggered:{
            scene.zombie_ani_5.start()
            scene.zombie_ani_6.start()
            zombie_timer_02.start()
        }
    }
    Timer{
        id: zombie_timer_02
        interval:14000
        triggeredOnStart: false
        onTriggered:{
            scene.zombie_ani_0.start()
            scene.zombie_ani_2.start()
            scene.zombie_ani_7.start()
            scene.zombie_ani_9.start()
            zombie_timer_03.start()
        }
    }
    Timer{
        id: zombie_timer_03
        interval:16000
        triggeredOnStart: false
        onTriggered:{
            scene.zombie_ani_1.start()
            scene.zombie_ani_4.start()
            scene.zombie_ani_8.start()
        }
    }
    Timer{
        id: zombie_timer2
        interval:10000
        triggeredOnStart: false
        onTriggered:{
            scene.zombie_ani_10.start()
            scene.zombie_ani_11.start()
            scene.zombie_ani_12.start()
            scene.zombie_ani_13.start()
            scene.zombie_ani_14.start()
            scene.zombie_ani_15.start()
            scene.zombie_ani_16.start()
            scene.zombie_ani_17.start()
            scene.zombie_ani_18.start()
            scene.zombie_ani_19.start()
        }
    }

    Text{
        id: swText
        text: "A Huge Wave Of Zombies Is Approaching!"
        color: "red"
        font.weight: Font.Black
        font.pixelSize: 40
        font.family: "Leafy"
        anchors.centerIn: parent
        visible:false
    }

    Timer{
        id:swTextDis
        interval: 3000
        onTriggered: swText.destroy()
    }

    Timer{
        id:swTextVis
        interval: 1500
        onTriggered: swText.visible = true
    }

    Text{
        id: stText
        text: "GAME START!"
        color: "red"
        font.weight: Font.Black
        font.pixelSize: 60
        font.family: "Leafy"
        anchors.centerIn: parent
        visible:false
    }

    Timer{
        id:stTextDis
        interval: 5000
        onTriggered: stText.visible = true
    }

    Timer{
        id:stTexVDis
        interval: 3000
        onTriggered: stText.destroy()
    }

    EntityManager{
        id:entityManager
        entityContainer: scene
    }

    Image{
        id:gameFial
        visible: false
        source: "../assets/interface/Fail.png"
        width:600;  height:480
        anchors.centerIn: parent
    }
}









