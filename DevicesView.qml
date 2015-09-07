import QtQuick 2.0
import "Color.js" as Color

RefreshableView {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Devices"

        Image {
            height: parent.height - 4*u
            width: parent.height - 4*u
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 4*u
            source: "qrc:/img/img/icon_add.png"
            fillMode: Image.Pad

            MouseArea {
                anchors.fill: parent
                onClicked: flowManager.showAddRoom()
            }
        }
    }


    TabView {
        id: tabView
        anchors.top: navigationBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: Color.BACKGROUND
        onSelectedIdChanged: devicesForTypeView.refresh(selectedId);
    }

    ErrorBar {
        anchors.top: tabView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        id: errorBar
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: errorBar.bottom
        anchors.bottom: parent.bottom


        DevicesForTypeView {
            id: devicesForTypeView
            anchors.fill: parent
            color: Color.BACKGROUND

            Component.onCompleted: refresh(tabView.selectedId);

        }
    }

    onRefreshUI: {
        devicesForTypeView.refresh(tabView.selectedId);
    }
}
