import QtQuick 2.15
import Felgo 3.0

EntityBase {

    entityType: "peashooter"
    anchors.fill: parent
    id:peid
    visible: true
    width: pea.width
    height: pea.height
    x:pea.x;y:pea.y

    AnimatedImage{
        id:pea
        width:70;height: 70
        //x:parent.x;y:parent.y
        x:200; y:200
        source: "../assets/PeaShooter.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(peid.entityId)}
        }
    }
    function changexy(x,y){
        pea.x=x
        pea.y=y
    }


}
