import QtQuick 2.15
import Felgo 3.0

//this is cherryBomb in grass
Item {
    anchors.fill: parent
    id:cher
    visible: true
    width: cherrybomb.width
    height: cherrybomb.height
    z:0

    Component.onCompleted: totalsun-=150
    AnimatedImage{
        id:cherrybomb
        width:70;height: 70
        source: "../assets/plants/CherryBomb.gif"
    }
}
