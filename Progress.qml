import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "black"
    opacity: 0.5
    z: 2
    visible: false

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Progress onClick")
        }
    }
}
