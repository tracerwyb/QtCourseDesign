import QtQuick 2.15
import Felgo 3.0

EntityBase {
    property bool isStand: false

    entityType: "potatoer"
    anchors.fill: parent
    id:po
    visible: true
    width: pea.width
    height: pea.height

    Component.onCompleted: {i++;console.log(i)}

    AnimatedImage{
        id:potatoer
        width:70;height: 70
        source: "../assets/plants/PotatoMineNotReady.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(po.entityId)}
        }
    }
    function changexy(x,y){
        potatoer.x=x
        potatoer.y=y
    }
}
