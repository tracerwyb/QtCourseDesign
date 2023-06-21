import QtQuick 2.15
import Felgo 3.0
//potato in grass
EntityBase {
    property bool isStand: false

    entityType: "potatoer"
    anchors.fill: parent
    id:po
    visible: true
    width: potatoer.width
    height: potatoer.height
//    x:parent.x;y:parent.y

    Component.onCompleted: {i++;console.log(i)}

    AnimatedImage{
        id:potatoer
        width:70;height: 70
        //x:parent.x;y:parent.y
        //x:200; y:200
        source: "../assets/plants/PotatoMineNotReady.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(po.entityId)}
        }
    }
}
