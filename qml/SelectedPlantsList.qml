import QtQuick 2.15
import Felgo 3.0
import QtQuick.Layouts 1.0

Rectangle{

    width: 620
    height: 80

    property alias sun: sun
    property alias pea: pea
    property alias ptt: ptt
    property alias repeater: repeater
    property alias wallnut: wallnut
    property alias cherryBomb: cherryBomb
    property alias snowpeashooter: snowpeashooter
    property alias shovel: shovel

    color: "transparent"                       // background lucency

    BackgroundImage{
        width: parent.width
        height: parent.height
        source:"../assets/interface/Shop.png"
        Text {
            x:49;y:85
            font.pixelSize: 20
            color: "black"
            id: suntext
            text: totalsun
        }
    }

    GridView{
        id: listBack

        model:7
        width:parent.width*0.8
        height:parent.height-20
        x:120;    y:15

        cellWidth: listBack.width/7;

        delegate: rec
    }

    Component{
        id:rec
        Rectangle{
            width:listBack.width/7.5;    height:listBack.height-10
            color:"#14ffffff"
            radius: 6
        }
    }

    EntityManager{
        id: entityManager

        entityContainer: scene
    }

    /*selected plants list*/

    RowLayout{
        id:rowL
        x: listBack.x;  y: 15
        Rectangle{
            id:sun
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            SunFlower{
                id:ts
                visible: true
                anchors.fill: parent
                Drag.active: dragsunflower.drag.active;
                Drag.supportedActions: Qt.MoveAction
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragsunflower
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 25 ? true:false
                    anchors.fill: ts
                    drag.target: ts
                    onPressed:{
                        //createplant="Sunflower.qml"
                        model = sunflower_model
                        totalsun-=25
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/SunFlower.png"
                                 })
                    }
                }
            }
        }
        Rectangle{
            id:pea
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            PeaShooter{
                id:pe
                visible: true
                anchors.fill: parent
                Drag.active: dragpea.drag.active;
                Drag.supportedActions: Qt.MoveAction
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragpea
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 100? true:false
                    anchors.fill: pe
                    drag.target: pe
                    onPressed:{
                        model = peashooter_model
                        totalsun-=100
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/PeaShooter.png"
                                 })
                    }
                }
            }
        }
        Rectangle{
            id:ptt
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            Potato{
                id:pptid
                visible: true
                anchors.fill: parent
                Drag.active: dragppt.drag.active;
                Drag.supportedActions: Qt.MoveAction
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragppt
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 25 ? true:false
                    anchors.fill: pptid
                    drag.target: pptid
                    onPressed:{
                        model = potato_model
                        totalsun-=25
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/PotatoMine.png"
                                 })
                    }
                }
            }
        }
        Rectangle{
            id:repeater
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            Repeat{
                id:rep
                visible: true
                anchors.fill: parent
                Drag.active: dragrepeater.drag.active;
                Drag.supportedActions: Qt.MoveAction
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragrepeater
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 200 ? true:false
                    anchors.fill: rep
                    drag.target: rep
                    onPressed:{
                        model = repeater_model
                        totalsun-=200
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/Repeater.png"
                                 })
                    }
                }
            }
        }
        Rectangle{
            id:wallnut
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            WallNut{
                id:wn
                visible: true
                anchors.fill: parent
                Drag.active: dragwallnut.drag.active;
                Drag.supportedActions: Qt.MoveAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragwallnut
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 50 ? true:false
                    anchors.fill: wn
                    drag.target: wn
                    onPressed:{
                        model = wallnut_model
                        totalsun-=50
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/WallNut.png"
                                 })
                    }
                }
            }
        }
        Rectangle{
            id:cherryBomb
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            CherryBomb{
                id:cb
                visible: true
                anchors.fill: parent
                Drag.active: dragcherryBomb.drag.active;
                Drag.supportedActions: Qt.MoveAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragcherryBomb
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 150 ? true:false
                    anchors.fill: cb
                    drag.target: cb
                    onPressed: {
                        model = cherrybomb_model
                        totalsun-=150
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/CherryBomb.png"
                                 })
                        target=cb

                    }
                }
            }
        }
        Rectangle{
            id:snowpeashooter
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            SnowPeaShooter{
                id:sps
                visible: true
                anchors.fill: parent
                Drag.active: dragsnowpeashooter.drag.active;
                Drag.supportedActions: Qt.MoveAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragsnowpeashooter
                    //when play game ,sun enough enable to true
                    enabled: totalsun >= 175 ? true:false
                    anchors.fill: sps
                    drag.target: sps
                    onPressed:{
                        model = snownpeashooter_model
                        totalsun-=175
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/SnowPeaShooter.png"
                                 })
                    }
                }
            }
        }
    }
    Rectangle{
        id:shovel
        visible: false
        x:rowL.x+listBack.width
        width:listBack.width/6.5;    height:listBack.height-10
        Shovel{
            id:shv
            visible: true
            anchors.fill: parent
            Drag.active: dragShovel.drag.active;
            Drag.supportedActions: Qt.MoveAction
            Drag.dragType: Drag.Automatic;
            Drag.mimeData: {"opt": source}

            MouseArea {
                id: dragShovel
                anchors.fill: shv
                drag.target: shv
                onPressed:{
                    model = shovel_model
                    parent.grabToImage(function() {
                                 parent.Drag.imageSource = "../assets/interface/Shovel.png"
                             })
                }
            }
        }
    }
}
