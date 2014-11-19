import QtQuick 2.0

Item {
    width: parent.width
    height: 30*u

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "lightGray"
        border.color: "black"
        border.width: 1

        Text {
            anchors.centerIn: parent
            text: name;
            font.pixelSize: 30
        }
    }
}
