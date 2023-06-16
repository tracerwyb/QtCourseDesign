import Felgo 3.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.15

GameWindow{
    id:gameWindow

    property alias sun: scene.selSun
    property alias pea: scene.selPea
    property alias ptt: scene.selPtt
    property alias repeate: scene.selRepeater
    property alias seedChooser: scene.seedChooser

    activeScene: scene

    screenWidth: 1180
    screenHeight: 800

    Scne{
        id:scene
        anchors.fill: parent

    }

    TapHandler{
        onTapped: {
//            scene.startAnimation.start();
            timer.start()
            carAni.start()
        }
    }

    Timer{
        id:timer
        triggeredOnStart: false
        interval: 0
        onTriggered: {
            scene.setCarHVisble();
//            scene.carAnimation.start();
        }
    }

    Timer{
        id:carAni
        triggeredOnStart: false
        interval: 0
        onTriggered: {
            scene.setCarHDisable();
            scene.seledPlantVis = true;
            scene.choseVis = true;
        }
    }
}
















//GameWindow {
//    id: gameWindow

//    activeScene: scene

//    screenWidth: 960
//    screenHeight: 640

//    Scene {
//        id: scene

//        width: 480
//        height: 320

//       Rectangle {
//            id: rectangle
//            anchors.fill: parent
//            color: "grey"

//            Text {
//                id: textElement
//                // qsTr() uses the internationalization feature for multi-language support
//                text: qsTr("Hello Felgo World")
//                color: "#ffffff"
//                anchors.centerIn: parent
//            }

//            MouseArea {
//                anchors.fill: parent

//                // when the rectangle that fits the whole scene is pressed, change the background color and the text
//                onPressed: {
//                    textElement.text = qsTr("Scene-Rectangle is pressed at position " + Math.round(mouse.x) + "," + Math.round(mouse.y))
//                    rectangle.color = "black"
//                    console.debug("pressed position:", mouse.x, mouse.y)
//                }

//                onPositionChanged: {
//                    textElement.text = qsTr("Scene-Rectangle is moved at position " + Math.round(mouse.x) + "," + Math.round(mouse.y))
//                    console.debug("mouseMoved or touchDragged position:", mouse.x, mouse.y)
//                }

//                onReleased: {
//                    textElement.text = qsTr("Hello Felgo World")
//                    rectangle.color = "grey"
//                    console.debug("released position:", mouse.x, mouse.y)
//                }
//            }
//        }// Rectangle with size of logical scene

////        Image {
////            id: felgoLogo
////            source: "../assets/felgo-logo.png"

////            // 50px is the "logical size" of the image, based on the scene size 480x320
////            // on hd or hd2 displays, it will be shown at 100px (hd) or 200px (hd2)
////            // thus this image should be at least 200px big to look crisp on all resolutions
////            // for more details, see here: https://felgo.com/doc/felgo-different-screen-sizes/
////            width: 50
////            height: 50

////            // this positions it absolute right and top of the GameWindow
////            // change resolutions with Ctrl (or Cmd on Mac) + the number keys 1-8 to see the effect
////            anchors.right: scene.gameWindowAnchorItem.right
////            anchors.top: scene.gameWindowAnchorItem.top

////            // this animation sequence fades the Felgo logo in and out infinitely (by modifying its opacity property)
////            SequentialAnimation on opacity {
////                loops: Animation.Infinite
////                PropertyAnimation {
////                    to: 0
////                    duration: 1000 // 1 second for fade out
////                }
////                PropertyAnimation {
////                    to: 1
////                    duration: 1000 // 1 second for fade in
////                }
////            }
////        }

//    }

//}

