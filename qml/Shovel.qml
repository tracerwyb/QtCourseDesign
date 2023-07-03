import QtQuick 2.0
import Felgo 3.0
//this is a shovel
Item {
    width:60;  height: 60;

    Image{
        source: "../assets/interface/ShovelBank.png"
        anchors.fill: parent
        Image{
            source: "../assets/interface/Shovel.png"
            anchors.fill: parent
        }
    }
}
