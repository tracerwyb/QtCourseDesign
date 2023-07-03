import Felgo 3.0
import QtQuick 2.15
import QtQuick.Controls 2.0
//button Component to create button
Item {
    id: button

    width: butimg.width
    height: butimg.height

    property alias source: butimg.source
    property alias tap: taphandler
    MultiResolutionImage {
        id: butimg
    }
    TapHandler{
            id:taphandler
    }
}
