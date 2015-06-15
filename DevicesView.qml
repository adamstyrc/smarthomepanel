import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Devices"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom

        DeviceTypesList {
            anchors.fill: parent
            color: Color.COMPONENT_BACKGROUND
            visible: flowManager.isTopLevel
        }

        DevicesForTypeList {
            anchors.fill: parent
            color: Color.BACKGROUND
            visible: !flowManager.isTopLevel
        }
    }
}
