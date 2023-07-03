import QtQuick 2.15
import Felgo 3.0
//sonwpeashooter in selection bar
AnimatedImage {
    id: snowPeashooter

    visible: true
    source: "../assets/interface/Card.png"
    width: 67; height: 100

    Image {
        x: width / 5
        y: height / 3.5
        width:parent.width*2/3
        height: parent.height/2
        source: "../assets/plants/SnowPeaShooter.png"
    }
    Text {
        id:te
        y: parent.height-20
        x: 22
        text: qsTr("175")
    }


    ChangeBlack{id:blak; anchors.fill: parent}
    TapHandler{
       onTapped: {
           if(blak.visible === false)
                blak.visible = true
           else blak.visible = false
       }
    }

}
