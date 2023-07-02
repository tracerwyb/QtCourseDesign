import QtQuick 2.15
import Felgo 3.0

Item{
    id: pea_bullet
    width:30;  height: 20;

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

//    EntityManager{id:entityManage;  entityContainer: scene}

    BoxCollider {
        id:collider

        enabled: true
        fixture.restitution: 0.5
        collisionTestingOnlyMode: true
        categories: Box.Category1
        collidesWith: Box.Category2
        body.bullet: true
        anchors.fill: parent
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;

            console.log("boom")
//            console.log("Pea",pea_bullet.x, pea_bullet.y )
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
