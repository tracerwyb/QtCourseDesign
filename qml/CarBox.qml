import QtQuick 2.0
import Felgo 3.0

//car in grass left
EntityBase{
    id: car
    entityType: "car"
    width:90;   height:70
    visible:false
    Image{
       anchors.fill: parent
       source: "../assets/interface/LawnMower.gif"
    }
    BoxCollider {
        id:collider

        enabled: true
        fixture.restitution: 0.5
        categories: Box.Category1
        collidesWith: Box.Category2
        width:90;   height:100
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;
            if(otherEntityId.substring(0,6)==="zombie"){
                allZombiesDie.start()
                destorySingleCar.start()
            }
            if(otherEntityId.substring(0,7)==="wall_19"){
                removeentity()
            }
        }
    }

    NumberAnimation {
        id: allZombiesDie
        target: car
        property: "x"
        duration: 3200
        to:2000
    }
    Timer{
        id: destorySingleCar
        interval:allZombiesDie.duration
        onTriggered: car.destroy()
    }
}
