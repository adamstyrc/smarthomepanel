import QtQuick 2.0
import "Color.js" as Color
import "Dimension.js" as Dimension


Item {
    width: parent.width
    height: 30*u

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND

        Image {
            id: image
            height: 24*u
            width: 24*u
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: Dimension.SPACING*u
            source: "img/light_icon"

            MouseArea {
                anchors.fill: parent
                onClicked: flowManager.showAddRoom()
            }
        }

        OnOffButton {
            width: 20*u
            height: 12*u
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: Dimension.SPACING*u
            checked: deviceState === 1

            Component.onCompleted: {
                console.log("state: " + state)
            }
        }

        Text {
            anchors.left: image.right
//            anchors.right: image.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: Dimension.SPACING*u
            text: name;
            font.pixelSize: 30
        }
    }
}
