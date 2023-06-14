import QtQuick 2.15
import Felgo 3.0
import QtQuick.Controls 2.0
// EMPTY SCENE
/**
  This is start page

 **/

Scene{
    id:startscene
    width: 1400
    height: 600
    MultiResolutionImage{
        anchors.fill: parent
        //anchors.centerIn: parent
        source: "../assets/background.png"
    }

    /**
      A button is used to start game
     **/
    ButtonImage{
        x:400
        y:450
        id:b1

        //source: "../assets/Button.png"
        source: "../assets/SelectorScreen_Adventure_button.png"
        states:  [
                  State {
                       name: "light"; when:b1.tap.pressed
                       PropertyChanges {
                            target: b1;source:"../assets/SelectorScreen_Adventure_highlight.png"
                       }
                   }
               ]
        }
    Audio{
        id:audio
    }

    /**
     A button is used to control whether play music
     state "st" is stop
     state "pl" is play
    **/
    ButtonImage{
        id:audiobutton
        x:900
        y:450
        MultiResolutionImage{
            x:-44
            y:-3
            width: 42
            height: 39
            source: "../assets/audio.jpeg"
        }
        state:play
        source:"../assets/options_checkbox1.png"
        states:  [
             State{
                name:"play"
                PropertyChanges {target: audiobutton; source:"../assets/options_checkbox1.png"}
                },
             State {
                name: "stop";
                PropertyChanges {target: audiobutton; source:"../assets/options_checkbox0.png"}}
               ]
       TapHandler{
           onTapped: {
               audio.state = "st"
               audiobutton.state = "stop"
           }
           onDoubleTapped: {
               audio.state = "pl"
               audiobutton.state = "play"
           }
       }

    }

    /**
      This is a help,help you to know about the game
     **/

    ButtonImage{
        id:helpButton
        x:1100; y:450
        source:"../assets/SelectorScreen_Help2.png"
        states:  [
                  State {
                       name: "light"; when:helpButton.tap.pressed
                       PropertyChanges {target: helpButton;source:"../assets/SelectorScreen_Help1.png"}
                   }
               ]
        Label{
            width: startscene.width
            height: startscene.height
            id:lhelp
            visible: false
            text: "this is a help and help you to know mor about plant an combie"
            color: "red"
        }
        TapHandler{
            onTapped: {
                lhelp.visible =true
            }
        }

//Help{
//    id:helpsene
//    opacity: 0
//}
//        onTapChanged: {
//           helpsene.opacity=2
//    }
//    Label{
//        text: "this is a help"
//        color: "white"
//    }
}
    /**
      This is a exit button
     **/
    ButtonImage{
        id:exit
        x:250; y:450
        source:"../assets/SelectorScreen_Quit2.png"
        states:  [
                  State {
                       name: "light"; when:exit.tap.pressed
                       PropertyChanges {
                            target: exit;source:"../assets/SelectorScreen_Quit1.png"
                       }
                   }
               ]
        TapHandler{
            onTapped: {
                 //nativeUtils.displayMessageBox("Really quit the game?", "", 2);
                Qt.quit()
            }
        }
    }

}
