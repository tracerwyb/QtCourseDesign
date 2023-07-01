import QtQuick 2.15
import Felgo 3.0
//potato in grass
Item {
    property bool isStand: false
    property alias potatoer: potatoer
    anchors.fill: parent
    visible: true
    width: potatoer.width
    height: potatoer.height

    AnimatedImage{
        id:potatoer
        width:70;height: 70
        source: "../assets/plants/PotatoMineNotReady.gif"
    }
    Timer{
        id:stand
        interval: 4000
        running: true
        onTriggered: potatoer.source = "../assets/plants/PotatoMine.gif"
    }
}
