import QtQuick 2.0
import "Color.js" as Color


Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Rooms"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom

        RoomsList {
            anchors.fill: parent
            color: Color.COMPONENT_BACKGROUND
            visible: flowManager.isTopLevel
        }

        RoomPanel {
            anchors.fill: parent
            color: Color.BACKGROUND
            visible: !flowManager.isTopLevel
        }
    }
}
