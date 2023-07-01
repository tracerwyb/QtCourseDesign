import QtQuick 2.0
import Felgo 3.0

Item {
    id: boom

    AnimatedImage{
        source: "../assets/plants/Boom.gif"
    }

    Timer{
        running: true
        interval: 1000
        onTriggered: boom.destroy()
    }
}
