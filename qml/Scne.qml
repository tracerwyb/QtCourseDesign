import QtQuick 2.15
import Felgo 3.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtTest 1.15
import QtQml 2.15

// EMPTY SCENE

Scene {

    property alias seledPlantVis: selectedPlant.visible
    property alias choseVis: seedChooser.visible
    property alias startAnimation: pathAnim
    property alias carAnimation: carHAnim
    property alias grass: backGround

    property alias selSun: selectedPlant.sun
    property alias selPea: selectedPlant.pea
    property alias selPtt: selectedPlant.ptt
    property alias selRepeater: selectedPlant.repeater

    property alias seedChooser: seedChooser

    property alias zombie_ani_0: zombie_ani_0
    property alias zombie_ani_1: zombie_ani_1
    property alias zombie_ani_2: zombie_ani_2
    property alias zombie_ani_3: zombie_ani_3
    property alias zombie_ani_4: zombie_ani_4
    property alias zombie_ani_5: zombie_ani_5
    property alias zombie_ani_6: zombie_ani_6
    property alias zombie_ani_7: zombie_ani_7
    property alias zombie_ani_8: zombie_ani_8

    property int singlePlantWidth: parent.width/14
    property int singlePlantHeight: parent.height/8

    /* set cars' visible as true */
    function setCarHVisble(){ carH.visible=true;}

    /* set cars' visible as false */
    function setCarHDisable(){ carH.visible=false;}

    /* start animation */
    PathAnimation {
        id:pathAnim

        target:backGround
        duration:8000

        easing.type:Easing.OutInQuad
        path: Path {
            PathCurve { x: 250;}
            PathCurve { x: -280;}
            PathCurve { x: 0;}    //last element is empty with no end point specified
        }
    }

    /* car animation*/
    NumberAnimation {
        id:carHAnim
        target: carH

        property: "x"
        from:600
        to:0
        duration: 800
//        easing.type: Easing.InOutQuad

    }

    /* select plant */
    Rectangle{
        id:backGround
        width: parent.width * 1.6
        height: parent.height

        // background Image
        BackgroundImage{
            id: selScene
            width: backGround.width
            height: backGround.height
            source: "../assets/interface/Background.jpg"
            clip:true
            x: -270
        }


        ColumnLayout{
            /* this is a List of selected plants on the top of game screen */
            SelectedPlantsList{
                id:selectedPlant
                visible: false

                width: singlePlantWidth*8
                height: singlePlantHeight*1.2
            }
            /* this is a box that shows all of alternative plants and allowed player to choose plants */
            SeedChooser{
                id: seedChooser
                visible: false

                height: selectedPlant.height*5
                width: height


            }
        }

        /* initial cars on grass left */
        ColumnLayout{
            id: carBox

            x:0
            y:parent.height/7
            height: parent.height
            ListView{
                id:carH
                height: parent.height
                visible: false

                spacing: parent.height/14.8
                model: 5
                delegate: MyType{}
                component MyType: Image{
                    id: car
                    width: height;
                    height: carH.height/10

                    source: "../assets/interface/LawnMower.gif"
                }
            }
        }

        /*initial zombies*/
        BucketTheadZombie{ id: zombie_bucket_0;  x:1240;     y:100; }
        NormalZombie{ id: zombie_normal_1;    x: 1300;    y: 190; }
        NormalZombie{ id: zombie_normal_0;    x: 1370;    y: 200; }
        BucketTheadZombie{ id: zombie_bucket_1;  x:1240;     y:300; }
        ConeheadZombie{ id: zombie_cone_0;    x:1280;   y:400; }
        FlagZombie{ id:zombie_flag_0;   x:1300;     y:420; }
        ConeheadZombie{ id: zombie_cone_1;    x:1350;   y:470; }
        FlagZombie{ id:zombie_flag_1;   x:1350;     y:480; }
        NormalZombie{ id: zombie_normal_2;    x: 1300;    y: 500; }


        /* move zombies */
        NumberAnimation{ id:zombie_ani_0; target: zombie_normal_0; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_1; target: zombie_normal_1; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_2; target: zombie_normal_2; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_3; target: zombie_bucket_0; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_4; target: zombie_bucket_1; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_5; target: zombie_cone_0; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_6; target: zombie_cone_1; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_7; target: zombie_flag_0; property: "x"; to:0; duration: 52000; }
        NumberAnimation{ id:zombie_ani_8; target: zombie_flag_1; property: "x"; to:0; duration: 52000; }
    }

//    EntityManager{
//        id:entityManager
//    }

//    Timer {
//      interval: 3000;

//      onTriggered: {
//          // translate from the center of the opponent to a specified direction for the starting point
//          var startX = 100
//          var startY = 100
//          // create the bullet entity with the calculated parameters
//          entityManager.createEntityFromComponent/*WithProperties*/(
//                pea_shooter/*, {
////                  start: Qt.point(startX, startY),
////                  rotation : angle + 90,
////                  velocity: Qt.point(xDirection, yDirection)
//                }*/);
//        }
//      }
}



