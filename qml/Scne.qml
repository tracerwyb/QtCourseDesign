import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtTest 1.15

// EMPTY SCENE

Scene {

    property alias seledPlantVis: selectedPlant.visible
    property alias choseVis: seedChooser.visible
    property alias startAnimation: pathAnim
    property alias carAnimation: carHAnim
    property alias grass: backGround

    property alias selSun: selectedPlant.sun
    property alias selPea: selectedPlant.pea
    property alias selPtt: selectedPlant.ptt
    property alias selRepeater: selectedPlant.repeater

    property alias seedChooser: seedChooser

    property int singlePlantWidth: parent.width/14
    property int singlePlantHeight: parent.height/8

    property real i: 0                 //count the plants
    property real realx:0              //fix the plant x when drag it to grass
    property real realy:0              //fix the plant y when drag it to grass
    property string createplant        //use create plant to make sure use what kind of .qml to create plant
    property string planttype          //use this string to know entityType so that we can get the entityID to fix the position

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
            x: -270
        }


        ColumnLayout{
            SelectedPlantsList{
                id:selectedPlant
                visible: false

                width: singlePlantWidth*8
                height: singlePlantHeight*1.2
            }
            SeedChooser{
                id: seedChooser
                visible: false

                height: selectedPlant.height*5
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
                    width: height;
                    height: carH.height/10

                    source: "../assets/interface/LawnMower.gif"
                }
            }
        }
    }
    DropArea {
        id: dropContainer1
        anchors.fill: parent;
        onEntered: {
            entityManager.createEntityFromUrl(Qt.resolvedUrl(createplant))
            entityManager.getEntityById(planttype+"_"+i.toString()).visible=false
        }
        onDropped: {
            console.log(55555)
            if (drop.supportedActions == Qt.CopyAction){
                //console.log(drop.x)
               realx=locationx(drop.x)
               realy=locationy(drop.y)
               entityManager.getEntityById(planttype+"_"+i.toString()).changexy(realx,realy)
               entityManager.getEntityById(planttype+"_"+i.toString()).visible=true
                i++
            }
        }
    }

    //fix the plants when you drag it into the grass
    function locationx(x){
        console.log(x)
        if(0<x && x<scene.width/11)
            return scene.width/12
        if(scene.width/11<x && x<scene.width/11*2)
            return scene.width/12*2
        if(scene.width/11*2<x && x<scene.width/11*3)
            return scene.width/12*3+10
        if(scene.width/11*3<x && x<scene.width/11*4)
            return scene.width/12*4+20
        if(scene.width/11*4<x && x<scene.width/11*5)
            return scene.width/12*5+20
        if(scene.width/11*5<x && x<scene.width/11*6)
            return scene.width/12*6+50
        if(scene.width/11*6<x && x<scene.width/11*7)
            return scene.width/12*7+50
        if(scene.width/11*7<x && x<scene.width/11*8)
            return scene.width/12*8+50
        if(scene.width/11*8<x && x<scene.width/11*10)
            return scene.width/12*9+70
    }
    function locationy(y){
        if(scene.height/10<y && y<scene.height/3.75)
            return scene.height/5.2
        if(scene.height/3.75<y && y<scene.height/2.3)
            return scene.height/2.9
        if(scene.height/2.3<y && y<scene.height/1.6)
            return scene.height/1.95
        if(scene.height/1.6<y && y<scene.height/1.3)
            return scene.height/1.48
        if(scene.height/1.3<y)
            return scene.height/1.19
    }
}



