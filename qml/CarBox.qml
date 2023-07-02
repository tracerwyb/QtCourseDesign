import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id: car
    entityType: "car"
    width:height;   height:90
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
        anchors.fill: parent
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;
            allZombiesDie.start()
            destorySingleCar.start()
            console.log(id)
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
