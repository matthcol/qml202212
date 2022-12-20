import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 600
    visible: true
    title: qsTr("Hello World")

    User {
        id: user
    }

    Rectangle {
        id: panelLeft
        width: 320
        height: 240
        x: 0
        color: "red"
        visible: true

        Grid {
            columns: 2
            padding: user.textPadding
            spacing: user.textPadding

            Label {
                text: Positioner.index + " " + qsTr("Nom")
            }

            Rectangle {
                width: 100
                height: 20

                color:  "lightgrey"

                TextInput{
                    id: inputNom
                    anchors.fill: parent

                    color: "black"

                    onEditingFinished: {
                        console.log("Nom", text)
                    }
                }
            }

            Label {

                text: Positioner.index + " " + qsTr("Ville")
            }

            Rectangle {
                id: rectVille
                width: 100
                height: 20

                color:  "yellow"

                TextEdit{
                    id: inputVille
                    anchors.fill: parent
                    color: "green"
                    property int index: rectVille.Positioner.index

                    text:  index + " <ville>"

                    onEditingFinished: {
                        console.log("Ville", text)
                    }
                }
            }

            Label {

                text: "Sport"
            }

            TextField {
                id: inputSport


                onEditingFinished: {
                    console.log("Sport", text)
                }
            }

            Button {
                id: addButton
                text: qsTr("Ajouter")

                onClicked: {
                    console.log("Nom", inputNom.text,
                                " ; Sport: ", inputSport.text,
                                " ; Ville: ", inputVille.text )
                }
            }
        }
    }

    Item {
        id: panelRight
        anchors.left: panelLeft.right
        anchors.top: panelLeft.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        StackLayout {
            id: stackChoices
            currentIndex: 0

            function next() {
                currentIndex = (currentIndex + 1) % count
            }

            SportForm {
                id: sportForm

//                onSportChosen: sport => {
//                    console.log("Sport chosen:", sport)
//                    stackChoices.next()
//                }
            }

            Repeater {
                model: [ "green", "orange", "yellow", "red" ]
                Rectangle {
                    width: panelRight.width
                    height: panelRight.height
                    color: modelData


                    MouseArea {
                        anchors.fill: parent
                        onClicked: stackChoices.next()
                    }
                }
            }

        }
    }

    CustomItem {
        id: custom1
        anchors.left: parent.left
        anchors.top: panelLeft.bottom
    }

    CustomItem {
        id: custom2
        color: "yellow"
        counter: 12
        anchors.left: panelLeft.right
        anchors.top: parent.top
    }

    Connections {
        target: sportForm

        function onSportChosen(name) {
            console.log("Sport chosen:", name)
            stackChoices.next()
        }
    }
}
