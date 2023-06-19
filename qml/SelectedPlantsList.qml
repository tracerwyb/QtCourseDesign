import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.0

Rectangle{

    width: 620
    height: 80

    property alias sun: sun
    property alias pea: pea
    property alias ptt: ptt
    property alias repeater: repeater
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

    RowLayout{
//        width:listBack.width;   height:listBack.height-10
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
                    enabled: true
                    anchors.fill: ts
                    drag.target: ts
                    onPressed:{
                        createplant="Sunflower.qml"
                        planttype="sunflower"
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
                    enabled: true
                    anchors.fill: pe
                    drag.target: pe
                    onPressed:{
                        createplant="Peashooter.qml"
                        planttype="peashooter"
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
                    enabled: true
                    anchors.fill: pptid
                    drag.target: pptid
                    onPressed:{
                        createplant="Potatoer.qml"
                        planttype="potatoer"
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
                    enabled: true
                    anchors.fill: rep
                    drag.target: rep
                    onPressed:{
                        createplant="Repeater.qml"
                        planttype="repeater"
                        parent.grabToImage(function() {
                                     parent.Drag.imageSource = "../assets/plants/Repeater.png"
                                 })
                    }
                }
            }
        }
    }
}
