import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtTest 1.15

// EMPTY SCENE

Scene {
    visible: false
    property alias seledPlantVis: selectedPlant.visible
    property alias choseVis: seedChooser.visible
    property alias startAnimation: pathAnim
    property alias carAnimation: carHAnim
    property alias grass: backGround

    property int singlePlantWidth: parent.width/14
    property int singlePlantHeight: parent.height/8

    function setCarHVisble(){
        carH.visible=true;
    }

    function setCarHDisable(){
        carH.visible=false;
    }

    PathAnimation {
        id:pathAnim

        target:backGround
        duration:8000

        easing.type:Easing.OutInQuad
        path: Path {
            PathCurve { x: 250;}
            PathCurve { x: -280;}
            PathCurve { x: 0;}    //last element is empty with no end point specified
        }
    }


    NumberAnimation {
        id:carHAnim
        target: carH

        property: "x"
        from:600
        to:0
        duration: 800
//        easing.type: Easing.InOutQuad

    }

    Rectangle{
        id:backGround
        width: parent.width * 1.6
        height: parent.height
        BackgroundImage{
            id: selScene
            width: backGround.width
            height: backGround.height
            source: "../assets/interface/Background.jpg"
            clip:true
            x: -250
        }


        ColumnLayout{

            SelectedPlantsList{

                id:selectedPlant
                visible: false

                width: singlePlantWidth*7
                height: singlePlantHeight*1.2
            }
            SeedChooser{
                id: seedChooser
                visible: false

                height: backGround.height-selectedPlant.height
                width: height


            }
        }

        ColumnLayout{
            id: carBox

            x:0
            y:parent.height/7
            height: parent.height
            ListView{
                id:carH
                height: parent.height
                visible: false

                spacing: parent.height/14.8
                model: 5
                delegate: MyType{}
                component MyType: Image{
                    id: car
                    width: height
                    height: carH.height/10

                    source: "../assets/interface/LawnMower.gif"
                }
            }
        }
    }
}



