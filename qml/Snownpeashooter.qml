import QtQuick 2.15
import Felgo 3.0
//this qml is snowpeashooter in grass
Item {
    id:sno

    anchors.fill: parent
    visible: true
    width: snownpeashooter.width
    height: snownpeashooter.height

    // Pass in parameters during creation
    property var newEntityProperty

    AnimatedImage{
        id:snownpeashooter
        width:80;height: 80
        source: "../assets/plants/SnowPeaShooter.gif"
    }

    Component.onCompleted: {
        totalsun-=175
        newEntityProperty = { x = sno.parent.x+40,    y = sno.parent.y,     visible = true }
    }
    //bullet was created by this component
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
            //bullet move
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
                //Bullets collide with zombies and walls
                collidesWith: Box.Category2 | Box.Category3

                anchors.fill: parent
                fixture.onBeginContact: {
                    var collidedEntity = other.getBody().target;
                    var otherEntityId = collidedEntity.entityId;
                    var otherEntityParent = collidedEntity.parent;
                    if(otherEntityId.substring(0,6) === "zombie")
                    {
                        pea_bullet.destroy()
                        //This create a img that looks like bullet collide something
                        entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("PeaHit.qml"), {
                                "z": 1,
                                "x": pea_bullet.x,
                                "y": pea_bullet.y,
                              }
                       );
                    }
                    //if bullet collider the wall ,make the row'flag = false ,then the bullet will stop creating
                    if(otherEntityId.substring(0,4) === "wall")
                    {
                        if(screenHeight/10<pea_bullet.y && pea_bullet.y<screenHeight/3.75)
                            flag1=false
                        if(screenHeight/3.75<pea_bullet.y && pea_bullet.y<screenHeight/2.3)
                            flag2=false
                        if(screenHeight/2.3<pea_bullet.y && pea_bullet.y<screenHeight/1.6)
                            flag3=false
                        if(screenHeight/1.6<pea_bullet.y && pea_bullet.y<screenHeight/1.3)
                            flag4=false
                        if(screenHeight/1.3<pea_bullet.y)
                            flag5=false
                        pea_bullet.destroy()
                     // show a PeaHit image for a certain amount of time after removing the pea
                        entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("PeaHit.qml"), {
                                "z": 1,
                                "x": pea_bullet.x,
                                "y": pea_bullet.y,
                              }
                       );
                    }
                }
            }
        }
    }

    //create bullet if flag = true
    Timer{
        id:timer_pea
        repeat: true;
        running: true;
        interval: 1350
        onTriggered: {
            if(sno.parent.y===screnH/5.2 && flag1===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(sno.parent.y===screnH/2.9 && flag2===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(sno.parent.y===screnH/1.95 && flag3===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(sno.parent.y===screnH/1.48 && flag4===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(sno.parent.y===screnH/1.19 && flag5===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)

        }
    }
}
