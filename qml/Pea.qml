import QtQuick 2.15
import Felgo 3.0

EntityBase{
    id:pea_bullet
    width:50;  height: 50;

    Rectangle{
        color: "#00ffffff"
        anchors.fill: parent
        Image{
            source: "../assets/plants/Pea.gif"
            anchors.fill: parent
        }
    }

    MovementAnimation{
        id:move
        target: pea_bullet
        property: "x"
        velocity: 60
        running: true
    }

    EntityManager{id:entityManager}

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

            console.log("boom")
            console.log("Pea",pea_bullet.x, pea_bullet.y )
            if(otherEntityId.substring(0,6) === "zombie")
            {
                pea_bullet.destroy()

//                otherEntityParent.onDamageWithBulletType(pea_bullet);

//             // show a PeaHit image for a certain amount of time after removing the pea
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
