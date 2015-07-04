import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Devices"
    }

    TabView {
        id: tabView
        anchors.top: navigationBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Rectangle {

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tabView.bottom
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
