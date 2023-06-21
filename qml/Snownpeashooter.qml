import QtQuick 2.15
import Felgo 3.0

EntityBase {

    entityType: "snownpeashooter"
    anchors.fill: parent
    id:sno
    visible: true
    width: snownpeashooter.width
    height: snownpeashooter.height
//    x:parent.x;y:parent.y
    AnimatedImage{
        id:snownpeashooter
        width:70;height: 70
        source: "../assets/plants/SnowPeaShooter.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(sno.entityId)}
        }
    }

}
