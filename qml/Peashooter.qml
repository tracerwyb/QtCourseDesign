import QtQuick 2.15
import Felgo 3.0

EntityBase {

    entityType: "peashooter"
    anchors.fill: parent
    id:peid
    visible: true
    width: pea.width
    height: pea.height
    x:pea.x;    y:pea.y
    property real blood: 3

    Component.onCompleted: {i++;console.log(i)}

    AnimatedImage{
        id:pea
        width:70;height: 70
        x:200; y:200
        source: "../assets/PeaShooter.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(peid.entityId)}
        }
    }
    function changexy(x,y){
        pea.x=x
        pea.y=y
    }

//    EntityManager{ id:entityManager;    entityContainer: scene }
    BoxCollider {
        id:collider

        enabled: true
        density: 0
        friction: 0.4
        restitution: 0.4
        linearDamping: 100
        fixture.restitution: 0.5
        collisionTestingOnlyMode: true

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
}
