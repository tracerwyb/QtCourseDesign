import QtQuick 2.15
import Felgo 3.0
import QtQml.Models 2.15
import Qt.labs.folderlistmodel 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0

/*
    This qml show a gridview that you can choose the plants that
    you will use in game
*/
MultiResolutionImage{
    property real plantHeight: 85
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
        WallNut{
            id:wallNut;
            x:repeater.x+repeater.width+5;
            visible: true;
            height:plantHeight
            TapHandler{
                onTapped: {
                    if(wallnut .visible === false)
                        wallnut.visible = true;
                    else wallnut.visible = false;
                }
            }
        }
        CherryBomb{
            id:cherrybomb;
            x:wallNut.x+wallNut.width+5;
            visible: true;
            height:plantHeight
            TapHandler{
                onTapped: {
                    if(cherryBomb.visible === false)
                        cherryBomb.visible = true;
                    else cherryBomb.visible = false;
                }
            }
        }
        SnowPeaShooter{
            id:snowPeaShooter;
            x:cherrybomb.x+cherrybomb.width+5;
            visible: true;
            height:plantHeight
            TapHandler{
                onTapped: {
                    if(snowpeashooter.visible === false)
                        snowpeashooter.visible = true;
                    else snowpeashooter.visible = false;
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
                carHAnim.destroy()
                carBox.destroy()
                car0.visible = car1.visible = car2.visible = car3.visible = car4.visible = true
                zombie_timer.start()
                //dragtf=true
                skysunfall=true
                shovel.visible = true
                stTexVDis.start();
                stTextDis.start();
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
