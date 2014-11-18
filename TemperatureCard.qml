import QtQuick 2.0
import "Color.js" as Color

Item {
    id: cardContent

//    width: 80*u
//    height: 80*u
    width: cardWidth
    height: cardWidth

    property bool value : true

    Rectangle {
        width: parent.width - 5*u
        height: parent.height - 5*u
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND

        Image {
            id: icon
            source: "img/temperature_icon"
            width: (parent.width - 5*u) / 2
            height: (parent.width - 5*u) / 2
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            anchors.right: parent.right
            anchors.left: icon.right
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 14*u
            text: "18°C"
//                text: /*index + " C | "*/ + Screen.toString()
            wrapMode: Text.WrapAnywhere
        }
    }
}
