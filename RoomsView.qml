import QtQuick 2.0
import "Color.js" as Color


Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Rooms"

        Image {
            height: parent.height - 4*u
            width: parent.height - 4*u
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 4*u
            visible: stackView.depth > 1
            source: "img/img/add.png"

            MouseArea {
                anchors.fill: parent
                onClicked: flowManager.showAddRoom()
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom

        RoomsList {
            anchors.fill: parent
            color: Color.BACKGROUND
            visible: flowManager.isTopLevel
        }

        RoomPanel {
            anchors.fill: parent
            color: Color.BACKGROUND
            visible: !flowManager.isTopLevel
        }
    }
}
