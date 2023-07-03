import QtQuick 2.0
import Felgo 3.0

//CherryBomb'boom when CherryBomb plant in grass,after 1s will create boom
EntityBase {
    id: boom
    entityType: "boom"
    width : 200;   height : 170;

    AnimatedImage{
        anchors.fill: parent
        source: "../assets/plants/Boom.gif"
    }
    BoxCollider {
        id:collider
        active: true
        fixture.restitution: 0.5
        bodyType: Body.Static
        width : 100;   height : 100;
        categories: Box.Category1
        collidesWith: Box.Category2
        fixture.onBeginContact: {}
    }
    Timer{
        running: true
        interval: 1000
        onTriggered: boom.destroy()
    }
}
