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
    property alias selShovel: selectedPlant.shovel
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

    property alias car0: car0
    property alias car1: car1
    property alias car2: car2
    property alias car3: car3
    property alias car4: car4

    property int singlePlantWidth: parent.width/14
    property int singlePlantHeight: parent.height/8

    property real i: 0                 //count entities
    property real realx:0              //fix the plant x when drag it to grass
    property real realy:0              //fix the plant y when drag it to grass

    property var model

    property bool flag1: false;property bool flag2: false
    property bool flag3: false;property bool flag4: false
    property bool flag5: false;//property real flagx7: 1
//    property real flagx8: 1;property real flagx9: 1
//    property real flagy1: 1;property real flagy2: 1
//    property real flagy3: 1;property real flagy4: 1
//    property real flagy5: 1

//    property bool dragtf: totalsun > 0 ? true:false

//    property double screnH: screenHeight - 30

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

        CarBox{id:car0; y:backGround.height*0.15}
        CarBox{id:car1; y:backGround.height*0.15+130}
        CarBox{id:car2; y:backGround.height*0.15+260}
        CarBox{id:car3; y:backGround.height*0.15+390}
        CarBox{id:car4; y:backGround.height*0.15+520}

        /*initial zombies*/
        BucketTheadZombie{
            id: zombie_bucket_0;  x:1240;     y:screnH/1.95-40;
            MovementAnimation{ id:zombie_ani_3; target: zombie_bucket_0; property: "x"; velocity: -20 }
        }
        NormalZombie{
            id: zombie_normal_1;    x: 1300;    y: screnH/5.2-40;
            MovementAnimation{ id:zombie_ani_1; target: zombie_normal_1; property: "x"; velocity: -20 }
        }
        NormalZombie{
            id: zombie_normal_0;    x: 1370;    y: screnH/2.9-40;
            MovementAnimation{ id:zombie_ani_0; target: zombie_normal_0; property: "x"; velocity: -20 }
        }
        BucketTheadZombie{
            id: zombie_bucket_1;  x:1240;     y:screnH/1.19-40;
            MovementAnimation{ id:zombie_ani_4; target: zombie_bucket_1; property: "x"; velocity: -20 }
        }
        ConeheadZombie{
            id: zombie_cone_0;    x:2180;   y:screnH/2.9-40;
            MovementAnimation{ id:zombie_ani_5; target: zombie_cone_0; property: "x"; velocity: -20 }
        }
        FlagZombie{
            id:zombie_flag_0;   x:1800;     y:screnH/2.9-40;
            MovementAnimation{ id:zombie_ani_7; target: zombie_flag_0; property: "x"; velocity: -20 }
        }
        ConeheadZombie{
            id: zombie_cone_1;    x:1350;   y:screnH/1.48-20;
            MovementAnimation{ id:zombie_ani_6; target: zombie_cone_1; property: "x"; velocity: -20 }
        }
        FlagZombie{
            id:zombie_flag_1;   x:2550;     y:screnH/1.48-20;
            MovementAnimation{ id:zombie_ani_8; target: zombie_flag_1; property: "x"; velocity: -20; }
        }
        NormalZombie{
            id: zombie_normal_2;    x: 1600;    y: screnH/1.48-20;
            MovementAnimation{ id:zombie_ani_2; target: zombie_normal_2; property: "x"; velocity: -20 }
        }
    }
     Wall {
         id:wall1;
         x:1050;y:0
         BoxCollider {
           categories:Box.Category3
           collidesWith: Box.Category1 |Box.Category2
           anchors.fill: parent
           bodyType: Body.Static // the body shouldn't move
           fixture.onBeginContact: {
               console.log("this is wall1")
               var collidedEntity = other.getBody().target;
               var otherEntityId = collidedEntity.entityId;
               if(otherEntityId.substring(0,6) === "zombie"){ flag1=true }
           }
         }
     }
     Wall{
         id:wall2;
         x:1050;y:250;
         height: 100
         BoxCollider {
           categories:Box.Category3
           collidesWith: Box.Category1 |Box.Category2
           anchors.fill: parent
           bodyType: Body.Static // the body shouldn't move
           fixture.onBeginContact: {
               console.log("this is wall2")
               var collidedEntity = other.getBody().target;
               var otherEntityId = collidedEntity.entityId;
               if(otherEntityId.substring(0,6) === "zombie"){ flag2=true }
           }
         }
     }
     Wall{
         id:wall3;
         x:1050;y:360;
         height: 120
         BoxCollider {
           categories:Box.Category3
           collidesWith: Box.Category1 |Box.Category2
           anchors.fill: parent
           bodyType: Body.Static // the body shouldn't move
           fixture.onBeginContact: {
               console.log("this is wall3")
               var collidedEntity = other.getBody().target;
               var otherEntityId = collidedEntity.entityId;
               if(otherEntityId.substring(0,6) === "zombie"){ flag3=true }
           }
         }
     }
     Wall{
         id:wall4;
         x:1050;y:490;
         height: 100
         BoxCollider {
           categories:Box.Category3
           collidesWith: Box.Category1 |Box.Category2
           anchors.fill: parent
           bodyType: Body.Static // the body shouldn't move
           fixture.onBeginContact: {
               console.log("this is wall4")
               var collidedEntity = other.getBody().target;
               var otherEntityId = collidedEntity.entityId;
               if(otherEntityId.substring(0,6) === "zombie"){ flag4=true }
           }
         }
     }
     Wall{
         id:wall5;
         x:1050;y:640;
         height: 150
         BoxCollider {
           categories:Box.Category3
           collidesWith: Box.Category1 |Box.Category2
           anchors.fill: parent
           bodyType: Body.Static // the body shouldn't move
           fixture.onBeginContact: {
               console.log("this is wall5")
               var collidedEntity = other.getBody().target;
               var otherEntityId = collidedEntity.entityId;
               if(otherEntityId.substring(0,6) === "zombie"){ flag5=true }
           }
         }
     }
    Component{
        id:sunflower_model;
        EntityBase{
            entityType: "sunflower";

            property real number
            visible: false;
            Sunflower{id:sunf;property real blood: 5; anchors.fill: parent }
            BoxCollider {
                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                //bodyType: Body.Static
                categories: Box.Category1
               // collidesWith: Box.Category2 | Box.Category1
                anchors.fill: parent
              fixture.onBeginContact: {

                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;
                    console.log("was crashed")
                    if(otherEntityId.substring(0,6) === "zombie"){
                        sunf.blood--
                    }
                    if(number===plantnumber && otherEntityId.substring(0,6) !== "zombie")
                          removeEntity()
                    if(sunf.blood===0 || otherEntityId.substring(0,6) === "shovel"){ removeEntity() }
              }
            }
            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:peashooter_model;
        EntityBase{
            entityType: "peashooter"
            property real number

            visible: false;
            Peashooter{id: ps; property real blood: 5; anchors.fill: parent
            }
            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                //bodyType: Body.Static
                categories: Box.Category1
               // collidesWith: Box.Category2
                anchors.fill: parent
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;
                    if(ps.blood===0 || otherEntityId.substring(0,6) === "shovel"){ removeEntity() }
                    if(number===plantnumber && otherEntityId.substring(0,6) !== "zombie")
                          removeEntity()
                    if(otherEntityId.substring(0,6) === "zombie"){
                        ps.blood--
                    }
                }
            }
//            BoxCollider{
//                id:collider2
//                width: 500;height:70
//                categories: Box.Category1
//                collidesWith: Box.Category2
//                fixture.onBeginContact: {
//                    console.log("big colider was crash")
//                }
//            }

            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:repeater_model;
        EntityBase{
            visible: false;
            property real number
            entityType: "repeater"
            Rp{id:repeat; property real blood: 5; anchors.fill: parent }
            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                //bodyType: Body.Static
                categories: Box.Category1
                anchors.fill: parent
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;
                    if(otherEntityId.substring(0,6) === "zombie"){
                        repeat.blood--
                    }
                    if(number===plantnumber && otherEntityId.substring(0,6) !== "zombie")
                          removeEntity()
                    if(repeat.blood===0 || otherEntityId.substring(0,6) === "shovel"){ removeEntity() }
                }
            }
            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:potato_model;
        EntityBase{
            id:po
            entityType: "potatoer"
            visible: false;
            Potatoer{ id:potata; property real blood: 5; anchors.fill: parent }
            property real number

            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                categories: Box.Category1
                //collidesWith: Box.Category2

                anchors.fill: parent
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;

                    if((number===plantnumber && otherEntityId.substring(0,6) !== "zombie")|| otherEntityId.substring(0,6) === "shovel")
                          removeEntity()
                    if(otherEntityId.substring(0,6) === "zombie")
                    {
                        removeEntity()
                     //   po.destroy()
                     // show a xipu image for a certain amount of time after removing the pea
                        entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("PotatoText.qml"), {
                                "z": 1,
                                "x": po.x,
                                "y": po.y,
                              }
                       );
                    }
                }
            }
            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:wallnut_model;
        EntityBase{
            id:walNt
            visible: false;
            property real number
            Wallnuter{id: stt; property real blood: 20; anchors.fill: parent}
            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                categories: Box.Category1
                //collidesWith: Box.Category2

                anchors.fill: parent
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;
                    if((number===plantnumber && otherEntityId.substring(0,6) !== "zombie")
                            || otherEntityId.substring(0,6) === "shovel")
                          removeEntity()

                    console.log(otherEntityId,stt.blood)
                    if(otherEntityId.substring(0,6) === "zombie")
                    {
                        stt.blood--;
                    }
                    if(stt.blood === 12)
                        stt.wallnuter.source = "../assets/plants/WallNutCracked1.gif"
                    else if(stt.blood === 6)
                        stt.wallnuter.source = "../assets/plants/WallNutCracked2.gif"
                    else if(stt.blood === 0)
                        removeEntity();
                }
            }
             Component.onCompleted: number=plantnumber
        }

    }
    Component{
        id:snownpeashooter_model;
        EntityBase{
            visible: false;
            entityType: "snowshooter"
            property real number
            Snownpeashooter{id: sps; property real blood: 5; anchors.fill: parent  }
            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                categories: Box.Category1
               // collidesWith:Box.Category2
                anchors.fill: parent
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;

                    if((number===plantnumber && otherEntityId.substring(0,6) !== "zombie")
                            || otherEntityId.substring(0,6) === "shovel")
                          removeEntity()
                    if(otherEntityId.substring(0,6) === "zombie"){
                        sps.blood--
                    }
                    if(sps.blood===0){ removeEntity() }
                }
            }
            Component.onCompleted: number=plantnumber
        }
    }
    Component{
        id:cherrybomb_model;
        EntityBase{
            id: cheryBom
            entityType:"cherrybomb"
            visible: false;
            property real number
            Cherrybomb{
                Timer{
                    id: cherryboom

                    running: true
                    interval: 1000
                    onTriggered: {
                        entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("Boom.qml"), {
                                "z": 1,
                                "x": cheryBom.x,
                                "y": cheryBom.y,
                              }
                        );
                        cheryBom.width = 200
                        cheryBom.height = 200
                        removeEntity()
                    }
                }
            }
            BoxCollider {
                id:collider
                active: false
                fixture.restitution: 0.5
                bodyType: Body.Static
                anchors.fill: parent;
                categories: Box.Category1
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;
                    if(number===plantnumber)
                          removeEntity()
                }
            }
                 Component.onCompleted: number=plantnumber
        }
    }

    Component{
        id:shovel_model;
        EntityBase{
            visible: false;
            entityType: "shovel"
            Shovel{id: shov; anchors.fill: parent;  }
            BoxCollider {
                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                collidesWith:Box.Category1
                anchors.fill: parent
                fixture.onBeginContact: {
                    removeEntity();
                }
            }
        }
    }

    DropArea {
        id: dropContainer1
        anchors.fill: parent;
        onDropped: {
            if (drop.supportedActions == Qt.MoveAction){
                realx=locationx(drop.x)
                realy=locationy(drop.y)
                var newEntityProperties = {
                                     x: realx,
                                     y: realy,
                                     visible: true,
                                     z: 1
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
            return screnH/5.2
        if(screenHeight/3.75<y && y<screenHeight/2.3)
            return screnH/2.9
        if(screenHeight/2.3<y && y<screenHeight/1.6)
            return screnH/1.95
        if(screenHeight/1.6<y && y<screenHeight/1.3)
            return screnH/1.48
        if(screenHeight/1.3<y)
            return screnH/1.19

    }
}




