import QtQuick 2.15
import Felgo 3.0
import QtQuick.Controls 2.0
// EMPTY SCENE

Scene {
    anchors.bottomMargin: 150
    anchors.topMargin: 100
    anchors.leftMargin: 150
    id:scene
    MultiResolutionImage{
       id:img
       source:"../assets/Almanac_ZombieBack.jpg"
        }

    Label{
        id:lhelp
        Text {
            id: im
            x:300
            y:33
            text: qsTr("this is a help")
        }
        color: "red"
        background: img

        }

}
