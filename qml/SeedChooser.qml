import QtQuick 2.15
import Felgo 3.0
import QtQml.Models 2.15
import Qt.labs.folderlistmodel 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0

MultiResolutionImage{
    property real plantHeight: 85
//    property bool dragp: false
   // property alias changedragsunflower: changedragsunflower
   // property bool changedragsunflower: false
    height: 480
    width: height

    source: "../assets/interface/SeedChooser_Background.png"

    // the title of SeedChooser
    Rectangle{
        id: seedChooserTop

        width: parent.width
        height: parent.height / 14.5
        Text {
            text: "CHOOSE YOUR PLANTS"
            color: "black"
            font.weight: Font.bold
            font.pointSize: 20
            anchors.centerIn: parent

        }
        color: "transparent"
    }

    MoveToPointHelper{
    }
    // SeedChoosers' grid background
    GridView{
        id: plantItem

        model:40
        width:parent.width
        height:parent.width
        x:15;    y:40

        cellHeight:plantItem.width/7+5;  cellWidth: plantItem.width/9+5;

        delegate: numberDelegate
        SunFlower{
            id:sunFlower;
            x:0;    y:0;
            visible: true;
            height: plantHeight;
            TapHandler{
                onTapped: {
                        if(sun.visible === false)
                            sun.visible = true;
                        else sun.visible = false;
                        timer.start()
                }
            }


        }

        PeaShooter{
            id:peapea;
            x:sunFlower.x+sunFlower.width+5;
            visible: true;
            height:plantHeight
            TapHandler{
                onTapped: {
                    if(pea.visible === false)
                        pea.visible = true;
                    else pea.visible = false;
                }
            }
        }
        Potato{
            id:potato
            x:peapea.x+peapea.width+5;
            visible: true;
            height:plantHeight
            TapHandler{
                onTapped: {
                    if(ptt.visible === false)
                        ptt.visible = true;
                    else ptt.visible = false;
                }
            }
        }
        Repeat{
            id:repeater;
            x:potato.x+potato.width+5;
            visible: true;
            height:plantHeight
            TapHandler{
                onTapped: {
                    if(repeate.visible === false)
                        repeate.visible = true;
                    else repeate.visible = false;
                }
            }
        }
    }

    Component{
        id:numberDelegate

        Rectangle{
            id:rec

            width:plantItem.width/9;    height:plantItem.height/7
            color:"#14ffffff"

            radius: 6
        }
    }

    Button{
        id: seedChooserBottom

        width: 230
        height: 50
        x:(parent.width-width)/2;    y:520
        background: Rectangle{
            id: scbCol
            color:"#953f32"
        }
        TapHandler{
            onTapped: {
                scbCol.color = "#8B3626"
                seedChooser.destroy()
                dragtf=true
            }
        }

        Text{
            text: "LET'S ROCK TOGETHER!"
            color: "black"
            font.weight: Font.bold
            font.pointSize: 15
            anchors.centerIn: parent
        }
    }
}
