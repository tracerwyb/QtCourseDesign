import QtQuick 2.15
import Felgo 3.0
//repeater in grass
EntityBase {

    entityType: "repeater"
    anchors.fill: parent
    id:rept
    visible: true
    width: repeater.width
    height: repeater.height
    x:repeater.x;y:repeater.y

    AnimatedImage{
        id:repeater
        width:70;height: 70
        //x:parent.x;y:parent.y
        x:200; y:200
        source: "../assets/plants/Repeater.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(rept.entityId)}
        }
    }
    BoxCollider{
        enabled: true
        x: 0; y: 0
        density: 0
        friction: 0.4
        restitution: 0.4
        linearDamping: 100
        fixture.restitution: 0.5
        anchors.fill: parent
        width: 70;height: 70
        //bodyType: Body.Static

        // handle the collision
        fixture.onBeginContact: {
            console.log("this is repeater was colided")
        }

//          var collidedEntity = other.getBody().target;

//          // check if it hit a player
//          if (collidedEntity.isOfType("repeater")) {
//            // call damage method on playerRed or playerBlue
//            collidedEntity.removeEntity()
//          }
//        }
    }
    function changexy(x,y){
        repeater.x=x
        repeater.y=y
    }

}

