import QtQuick 2.15
import Felgo 3.0

EntityBase {
    id:rept

    property var newEntityProperty_0
    property var newEntityProperty_1

    entityType: "repeater"
    anchors.fill: parent
    visible: true
    width: pea.width
    height: pea.height
    AnimatedImage{
        id:repeater
        width:70;height: 70
        source: "../assets/plants/Repeater.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(rept.entityId)}
        }
    }

    Component.onCompleted: {
        newEntityProperty_0 = { x = rept.parent.x,    y = rept.parent.y,     visible = true }
        newEntityProperty_1 = { x = rept.parent.x+50,    y = rept.parent.y,     visible = true }
    }

    Component{ id:peaRp_model; EntityBase{ visible:false; Pea{} } }

    Timer{
        id:rp_timer
        repeat: true;
        running: true;
        interval: 2500
        onTriggered: {
            entityManager.createEntityFromComponentWithProperties(peaRp_model,newEntityProperty_0)
            entityManager.createEntityFromComponentWithProperties(peaRp_model,newEntityProperty_1)
        }
    }
}

