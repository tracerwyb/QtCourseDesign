import QtQuick 2.15
import Felgo 3.0
import QtQuick.Controls 2.0
// EMPTY SCENE
/**
  This is start page

 **/


Item{
    id:start
    width: parent.width
    height: parent.height

    Scene{
        MultiResolutionImage{
            anchors.fill: parent
            //anchors.centerIn: parent
            source: "../assets/background.png"
        }
        id:startscene
        width: 1400
        height: 600

        /**
          A button is used to start game
         **/
        ButtonImage{
            x:400
            y:450
            id:startgameImage
            source: "../assets/SelectorScreen_Adventure_button.png"
            states:  [
                      State {
                           name: "light"; when:startgameImage.tap.pressed
                           PropertyChanges {target: startgameImage;y:460; source:"../assets/SelectorScreen_Adventure_highlight.png"}
                       }
                   ]
            TapHandler{
                    onTapped: {
                        start.state = "gamebegin"
                        scene.startAnimation.start();
                        timer.start()
                        carAni.start()
                        timer.destroy()
                        scene.visible = true
                    }
                }
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

            TapHandler{
                onTapped: {
                    start.state = "helpstate"
                }
            }
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

    Help{
       id:helpscene
       visible: false
       width: parent.width
       height: parent.height
       Button{
           id:but
           x:500
           y:450
           text: "OK"
           flat:true
           MultiResolutionImage{
              source: "../assets/Button.png"
          }

           TapHandler{
              onTapped: {
              but.visible=helpscene.visible
              start.state = "startstate"
               }
             }
        }
    }
    states: [
        State {
            name: "helpstate"
            PropertyChanges {target: helpscene;visible:true;enabled:true}
            PropertyChanges {target: startscene;visible:false}
            PropertyChanges {target: window;activeScene:helpscene}
        },
        State{
            name:"startstate"
            PropertyChanges {target: start;visible:true}
            PropertyChanges {target: window;activeScene:startscene}
            PropertyChanges {target: helpscene;visible:false;}
        },
        State {
            name: "gamebegin"
            PropertyChanges {target: scene;visible:true;enabled:true}
            PropertyChanges {target: startscene;visible:false}
            PropertyChanges {target: window;activeScene:scene}
            PropertyChanges {target: startscene;visible:false}
        }
    ]

}




