import QtQuick 2.15
import Felgo 3.0

Item {
    id:sno

    anchors.fill: parent
    visible: true
    width: snownpeashooter.width
    height: snownpeashooter.height

    property var newEntityProperty
    AnimatedImage{
        id:snownpeashooter
        width:80;height: 80
        source: "../assets/plants/SnowPeaShooter.gif"
    }
    Component.onCompleted: {
        newEntityProperty = { x = sno.parent.x+40,    y = sno.parent.y,     visible = true }
    }
    Component{ id:pea_model;
        EntityBase{
            visible:false;
            id: pea_bullet
            entityType: "pea"
            width:46;  height: 40;

            Rectangle{
                color: "#00ffffff"
                anchors.fill: parent
                Image{
                    source: "../assets/plants/SnowPea.gif"
                    anchors.fill: parent
                }
            }

            MovementAnimation{
                id:move
                target: pea_bullet
                property: "x"
                velocity: 100
                running: true
            }

            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                categories: Box.Category1
                collidesWith: Box.Category2

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
                    }
                }
            }
        }
    }

    Timer{
        repeat: true;
        running: true;
        interval: 1350
        onTriggered: {
            entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
        }
    }
}
