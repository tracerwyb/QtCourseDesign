import QtQuick 2.15
import Felgo 3.0

AnimatedImage {
    id: sunFlower
    //property alias dragsunflower: dragsunflower
    //property var tx: te
    visible: false
    source: "../assets/interface/Card.png"
    width: 67; height: 100

    Image {
        x: width / 5
        y: height / 3.5
        width:parent.width*2/3
        height: parent.height/2
        source: "../assets/plants/SunFlower.gif"
    }
    Text {
        id:te
        y: parent.height-20
        x: 22
        text: qsTr("25")
    }

//    Drag.active: dragsunflower.drag.active;
//    Drag.supportedActions: Qt.CopyAction;
//    Drag.dragType: Drag.Automatic;
//    Drag.mimeData: {"opt": source}

//    MouseArea {
//        id: dragsunflower
//        //when play game ,turn enable to true
//        enabled: false
//        anchors.fill: sunFlower
//        drag.target: sunFlower
//        onPressed: parent.grabToImage(function() {
//                         parent.Drag.imageSource = "../assets/SunFlower.png"
//                     })
//    }

    ChangeBlack{id:blak; anchors.fill: parent}
    TapHandler{
       onTapped: {
           if(blak.visible === false)
                blak.visible = true
           else blak.visible = false
       }
    }
//    function changedrag(){
//        dragsunflower.enabled=true
//    }
}
