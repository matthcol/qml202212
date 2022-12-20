import QtQuick

Item {
    id: custom
    width: 100
    height: 100

    property color color: "blue"
    property int counter: 0

    Rectangle {
        anchors.fill: parent
        visible: true
        color: parent.color

        Text {
            id: label
            height: 20
            anchors.bottom: parent.bottom
            text: qsTr("Cpt") + " = " + counter
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                counter++
                console.log("Counter:", counter)
                label.text = qsTr("Cpt") + ` = ${counter}`
            }
        }

    }



}
