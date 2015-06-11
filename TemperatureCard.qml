import QtQuick 2.0
import "Color.js" as Color
import "Dimension.js" as Dimension


Item {
    id: cardContent

    width: cardWidth
    height: cardWidth

    property string name : "Thermometer"
    property string value : "-273°C"


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
                text: value + "°C"
                wrapMode: Text.WrapAnywhere
            }
        }
    }
}
