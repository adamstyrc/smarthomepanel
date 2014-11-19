import QtQuick 2.0
import "Color.js" as Color


Item {
    width: parent.width
    height: 30*u

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND

        Text {
            anchors.centerIn: parent
            text: name;
            font.pixelSize: 30
        }
    }
}
