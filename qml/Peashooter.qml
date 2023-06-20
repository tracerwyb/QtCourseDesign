import QtQuick 2.15
import Felgo 3.0

EntityBase {
    id:peid

    entityType: "peashooter"
    anchors.fill: parent
    visible: true
    width: pea.width
    height: pea.height
    property real blood: 3
    property var newEntityProperty

    AnimatedImage{
        id:pea
        width:70;height: 70
        source: "../assets/PeaShooter.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(peid.entityId)}
        }
    }

    BoxCollider {
        id:collider

        enabled: true
        density: 0
        friction: 0.4
        restitution: 0.4
        linearDamping: 100
        fixture.restitution: 0.5
        collisionTestingOnlyMode: true
//        categories: Box.Category1
//        collidesWith: Box.Category2

        anchors.fill: parent
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;

            if(otherEntityId.substring(0,6) === "zombie"){

//                otherEntityParent.onDamageWithBulletType(pea_bullet);

             // show a PeaHit image for a certain amount of time after removing the pea
//                entityManager.createEntityFromUrlWithProperties(
//                      Qt.resolvedUrl("PeaHit.qml"), {
//                        "z": 1,
//                        "x": peaShooter.x,
//                        "y": peaShooter.y,
//                      }
//               );
            }
        }
    }

    Component.onCompleted: {
        newEntityProperty = { x = peid.parent.x,    y = peid.parent.y,     visible = true }
    }
    Component{ id:pea_model; EntityBase{ visible:false; Pea{} } }

    Timer{
        repeat: true;
        running: true;
        interval: 2000
        onTriggered: {
            entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
        }
    }
}
