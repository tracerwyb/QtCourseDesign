import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.0
/*

// EXAMPLE USAGE:
// add this piece of code in your Scene to display the Button

PlayMusic {
  text: "Click Me!"
  width: 80
  height: 40
  anchors.centerIn: parent

  onClicked: {
    console.log("Clicked!")
  }
}

*/

GameButton {
    id: button
    width: 50
    height: 20
    // public events
    signal clicked
    signal pressed
    signal released

    property string defaultColor: "red"
    property string hoverColor: "blue"
    property alias text: buttonText.text

    // button background
    BackgroundImage: "./Button.png"
    BackgroundMusic: "Faster.mp3"

    // button text
    Text {
        id: buttonText
        anchors.centerIn: background
    }

    FelgoMultiplayer{
        id: musicPlayer


    }

    // change opacity on pressed and released events, so we have a "pressed" state
    onPressed: {
        opacity = 0.5
    }

    onReleased: {
        opacity = 1.0
    }
}
