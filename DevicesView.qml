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

        onSelectedIdChanged: devicesForTypeView.refresh(selectedId);
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tabView.bottom
        anchors.bottom: parent.bottom


        DevicesForTypeView {
            id: devicesForTypeView
            anchors.fill: parent
            color: Color.BACKGROUND

            Component.onCompleted: refresh(tabView.selectedId);
        }
    }
}
