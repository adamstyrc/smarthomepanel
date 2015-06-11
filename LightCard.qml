import QtQuick 2.0
import "Color.js" as Color
import "Dimension.js" as Dimension



Item {
    id: cardContent

    width: cardWidth
    height: cardWidth

    property string name : "Light"
    property bool value : true

    Rectangle {
        width: parent.width - Dimension.SPACING*u
        height: parent.height - Dimension.SPACING*u
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND

        Rectangle {
            width: parent.width - Dimension.SPACING*u
            height: parent.height - Dimension.SPACING*u
            anchors.centerIn: parent
            color: parent.color

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: name
            }

            Image {
                id: icon
                source: "img/light_icon"
                width: (parent.width - 5*u) / 2
                height: (parent.width - 5*u) / 2
                anchors.centerIn: parent
            }

            OnOffButton {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width / 2
                checked: value
            }
        }
    }
}
