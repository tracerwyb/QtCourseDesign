import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.14
Item{
    id:audio
    property alias ao: backaudio
    MediaPlayer{
        id:backaudio
        autoPlay: true
        source: "../assets/audio.mp3"

    }
    states:[
        State {
        name: "pl"
        PropertyChanges {
            target: backaudio
        }
        StateChangeScript{
            script: {
                backaudio.play()
            }
        }
    },
        State{
        name:"st"
        PropertyChanges {
            target: backaudio
        }
        StateChangeScript{
            script: {
                backaudio.stop()
            }
        }
        }

    ]
}

