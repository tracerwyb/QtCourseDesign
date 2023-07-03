import QtQuick 2.0
import Felgo 3.0

//potato boom in grass
Item {
    id: potatoText

    AnimatedImage{
        source: "../assets/plants/PotatoMineMashed.gif"
        AnimatedImage{
            width: 200;
            source: "../assets/plants/PotatoMineText.gif"
        }
    }

    Timer{
        running: true
        interval: 1000
        onTriggered: potatoText.destroy()
    }
}
