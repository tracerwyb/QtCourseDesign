import QtQuick 2.15
import Felgo 3.0

EntityBase {

    entityType: "cherrybomb"
    anchors.fill: parent
    id:cher
    visible: true
    width: cherrybomb.width
    height: cherrybomb.height
    x:cherrybomb.x;y:cherrybomb.y

    AnimatedImage{
        id:cherrybomb
        width:70;height: 70
        //x:parent.x;y:parent.y
        x:200; y:200
        source: "../assets/plants/CherryBomb.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(cher.entityId)}
        }
    }
    function changexy(x,y){
        cherrybomb.x=x
        cherrybomb.y=y
    }

}
