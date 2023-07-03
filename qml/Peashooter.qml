import QtQuick 2.15
import Felgo 3.0
//peashooter in grass
Item {
    id:peid
    anchors.fill: parent
    visible: true
    width: pea.width
    height: pea.height
    property real blood: 3
    property var newEntityProperty
    AnimatedImage{
        id:pea
        width:80;height: 80
        source: "../assets/PeaShooter.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(peid.entityId)}
        }
    }

    Component.onCompleted: {
        newEntityProperty = { x = peid.parent.x+40,    y = peid.parent.y,     visible = true }
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
                    source: "../assets/plants/Pea.gif"
                    anchors.fill: parent
                }
            }

            MovementAnimation{
                id:move
                target: pea_bullet
                property: "x"
                velocity: 140
                running: true
            }

            BoxCollider {
                id:collider

                enabled: true
                fixture.restitution: 0.5
                collisionTestingOnlyMode: true
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3

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

                     // show a PeaHit image for a certain amount of time after removing the pea
                        entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("PeaHit.qml"), {
                                "z": 1,
                                "x": pea_bullet.x,
                                "y": pea_bullet.y,
                              }
                       );
                    }
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

    Timer{
        id:timer_pea
        repeat: true;
        running: true;
        interval: 1350
        onTriggered: {
            if(peid.parent.y===screnH/5.2 && flag1===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(peid.parent.y===screnH/2.9 && flag2===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(peid.parent.y===screnH/1.95 && flag3===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(peid.parent.y===screnH/1.48 && flag4===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
            if(peid.parent.y===screnH/1.19 && flag5===true)
                entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)

            //entityManager.createEntityFromComponentWithProperties(pea_model,newEntityProperty)
        }
    }

}
