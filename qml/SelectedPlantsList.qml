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

    color: "transparent"                       // background lucency

    BackgroundImage{
        width: parent.width
        height: parent.height
        source:"../assets/interface/Shop.png"
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragsunflower
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: ts
                    drag.target: ts
                    onPressed:{
                        createplant="Sunflower.qml"
                        model = sunflower_model
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragpea
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: pe
                    drag.target: pe
                    onPressed:{
                        createplant="Peashooter.qml"
                        model = peashooter_model
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragppt
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: pptid
                    drag.target: pptid
                    onPressed:{
                        createplant="Potatoer.qml"
                        model = potato_model
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragrepeater
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: rep
                    drag.target: rep
                    onPressed:{
                        createplant="Repeater.qml"
                        model = repeater_model
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragwallnut
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: wn
                    drag.target: wn
                    onPressed:{
//                        model = repeater_model
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragcherryBomb
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: cb
                    drag.target: cb
                    onPressed:{
//                        model = repeater_model
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/CherryBomb.png"
                                 })
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
                Drag.supportedActions: Qt.CopyAction;
                Drag.dragType: Drag.Automatic;
                Drag.mimeData: {"opt": source}

                MouseArea {
                    id: dragsnowpeashooter
                    //when play game ,turn enable to true
                    enabled: dragtf
                    anchors.fill: sps
                    drag.target: sps
                    onPressed:{
//                        model = repeater_model
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/SnowPeaShooter.png"
                                 })
                    }
                }
            }
        }
    }
}
