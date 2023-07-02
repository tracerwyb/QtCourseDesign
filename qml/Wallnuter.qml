import QtQuick 2.15
import Felgo 3.0

//WallNut in grass
Item {
    id:walln

    property alias wallnuter: wallnuter

    anchors.fill: parent
    visible: true
    width: wallnuter.width
    height: wallnuter.height

    Rectangle{
        color: "#00ffffff"
        width:70;  height: 70;

        AnimatedImage{
            id:wallnuter
            anchors.fill: parent
            source: "../assets/plants/WallNut.gif"
        }
    }

}
