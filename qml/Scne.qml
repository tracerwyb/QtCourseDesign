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
    property alias selWallNut: selectedPlant.wallnut
    property alias selcherryBomb: selectedPlant.cherryBomb
    property alias selsnowpeashooter:selectedPlant.snowpeashooter

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

    property real i: 0                 //count entities
    property real realx:0              //fix the plant x when drag it to grass
    property real realy:0              //fix the plant y when drag it to grass
    //property string createplant        //use create plant to make sure use what kind of .qml to create plant
    property var model

//    property real flagx1: 1;property real flagx2: 1
//    property real flagx3: 1;property real flagx4: 1
//    property real flagx6: 1;property real flagx7: 1
//    property real flagx8: 1;property real flagx9: 1
//    property real flagy1: 1;property real flagy2: 1
//    property real flagy3: 1;property real flagy4: 1
//    property real flagy5: 1

//    property bool dragtf: totalsun > 0 ? true:false


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

    Component{
        id:sunflower_model;
        EntityBase{ entityType: "sunflower";
            property real number
            visible: false;
            Sunflower{id:sunf  }
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
              categories: Box.Category1
              //bodyType: body.Static
              //collidesWith: Box.Category2

              fixture.onBeginContact: {//"sunflowers was crashed"
                    if(number===plantnumber)
                          removeEntity()
              }
            }
            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:peashooter_model;
        EntityBase{
            entityType: "peashooter"
            visible: false;
            Peashooter{  }
        }
    }
    Component{
        id:repeater_model;
        EntityBase{ visible: false; Rp{  }}
    }
    Component{
        id:potato_model;
        EntityBase{
            entityType: "potatoer"
            visible: false;
            Potatoer{ }
            property real number
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
              categories: Box.Category1

              //collidesWith: Box.Category2

              fixture.onBeginContact: {//"sunflowers was crashed"
                    if(number===plantnumber)
                          removeEntity()
              }
            }
            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:wallnut_model;
        EntityBase{ visible: false; Wallnuter{  }}
    }
    Component{
        id:snownpeashooter_model;
        EntityBase{ visible: false; Snownpeashooter{  }}
    }
    Component{
        id:cherrybomb_model;
        EntityBase{
           entityType: "cherrybomb"
            visible: false;
            Cherrybomb{ }
            property real number
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
              categories: Box.Category1

              //collidesWith: Box.Category2

              fixture.onBeginContact: {//"sunflowers was crashed"
                  var collidedEntity = other.getBody().target;
                  var otherEntityId = collidedEntity.entityId;
                    if(number===plantnumber)// && otherEntityId.substring(0,6)!=="zombie")
                          removeEntity()
              }
            }
            Component.onCompleted: number=plantnumber
        }
    }

    DropArea {
        id: dropContainer1
        anchors.fill: parent;
        onDropped: {
            if (drop.supportedActions == Qt.MoveAction){
                //console.log(drop.x)
                realx=locationx(drop.x)
                realy=locationy(drop.y)
                var newEntityProperties = {
                                     x: realx,
                                     y: realy,
                                     visible: true
                                 }
                plantnumber++
                entityManager.createEntityFromComponentWithProperties(
                            model,
                            newEntityProperties);
            }
        }
    }

    //fix the plants when you drag it into the grass
    function locationx(x){
        console.log(x)
        if(0<x && x<screenWidth/11+20)
            return screenWidth/12
        if(screenWidth/11<x && x<screenWidth/11*2+20)
            return screenWidth/12*2
        if(screenWidth/11*2<x && x<screenWidth/11*3+20)
            return screenWidth/12*3+10
        if(screenWidth/11*3<x && x<screenWidth/11*4+20)
            return screenWidth/12*4+20
        if(screenWidth/11*4<x && x<screenWidth/11*5+20)
            return screenWidth/12*5+20
        if(screenWidth/11*5<x && x<screenWidth/11*6+20)
            return screenWidth/12*6+50
        if(screenWidth/11*6<x && x<screenWidth/11*7+20)
            return screenWidth/12*7+50
        if(screenWidth/11*7<x && x<screenWidth/11*8+20)
            return screenWidth/12*8+50
        if(screenWidth/11*8<x && x<screenWidth/11*10+20)
            return screenWidth/12*9+70
    }
    function locationy(y){
        if(screenHeight/10<y && y<screenHeight/3.75)
            return screenHeight/5.2
        if(screenHeight/3.75<y && y<screenHeight/2.3)
            return screenHeight/2.9
        if(screenHeight/2.3<y && y<screenHeight/1.6)
            return screenHeight/1.95
        if(screenHeight/1.6<y && y<screenHeight/1.3)
            return screenHeight/1.48
        if(screenHeight/1.3<y)
            return screenHeight/1.19

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



