import QtQuick 2.15
import Felgo 3.0
//potato in grass
EntityBase {

    entityType: "potatoer"
    anchors.fill: parent
    id:po
    visible: true
    width: pea.width
    height: pea.height
    x:pea.x;y:pea.y

    AnimatedImage{
        id:potatoer
        width:70;height: 70
        //x:parent.x;y:parent.y
        x:200; y:200
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
