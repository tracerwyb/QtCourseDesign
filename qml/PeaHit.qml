import QtQuick 2.0
import Felgo 3.0

Item {
    id: peaHit
    AnimatedImage{
        width:20;   height:20
        source: "../assets/plants/PeaHit.gif"
    }

    Timer{
        running: true
        interval: 500
        onTriggered: peaHit.destroy()
    }
}
