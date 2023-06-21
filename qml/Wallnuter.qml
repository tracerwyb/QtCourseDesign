import QtQuick 2.15
import Felgo 3.0

//WallNut in grass
EntityBase {

    entityType: "wallnuter"
    anchors.fill: parent
    id:walln
    visible: true
    width: wallnuter.width
    height: wallnuter.height
//    x:parent.x;y:parent.y

    AnimatedImage{
        id:wallnuter
        width:70;height: 70
        source: "../assets/plants/WallNut.gif"
        TapHandler{
            id:hander
            onTapped:{
                console.log(hander.position)
                console.log(walln.entityId)}
        }
    }


}
