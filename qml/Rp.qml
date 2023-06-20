import QtQuick 2.15
import Felgo 3.0

EntityBase {

    entityType: "repeater"
    anchors.fill: parent
    id:rept
    visible: true

    AnimatedImage{
        id:repeater
        width:70;height: 70
        //x:parent.x;y:parent.y
        //x:200; y:200
        source: "../assets/plants/Repeater.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(rept.entityId)
            }
        }
    }
}

