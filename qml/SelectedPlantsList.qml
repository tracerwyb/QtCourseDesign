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
                id:sunCopy
                visible: true
                anchors.fill: parent
                TapHandler{
                    onTapped: {
                        entityManager.createEntityFromUrl(Qt.resolvedUrl("SunFlower.qml"));
                    }
                }
            }
        }


        Rectangle{
            id:pea
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            PeaShooter{
                visible: true
                anchors.fill: parent
            }
        }
        Rectangle{
            id:ptt
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            Potato{
                visible: true
                anchors.fill: parent
            }
        }
        Rectangle{
            id:repeater
            visible: false
            width:listBack.width/7.5;    height:listBack.height-10
            Repeater{
                visible: true
                anchors.fill: parent
            }
        }
    }
}
