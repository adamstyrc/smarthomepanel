import QtQuick 2.0
import QtQuick.Window 2.1
import "Color.js" as Color


Window {
    id: root
    width: 600
    height: 600
    visible: true

    property int u: 1

    FlowManager {
        id: flowManager
    }

    Rectangle {
        anchors.fill: parent
        focus: true

        Component.onCompleted: {
            u = Math.floor(Screen.logicalPixelDensity)
        }

        NavigationBar {
            id: navigationBar
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: navigationBar.bottom
            anchors.bottom: parent.bottom
            color: Color.BACKGROUND

            Dashboard {
                id: dashboard
                anchors.fill: parent
                visible: flowManager.isDashboardVisible
            }

            RoomsView {
                anchors.fill: parent
                visible: flowManager.isRoomsVisible
            }

            DevicesView {
                anchors.fill: parent
                visible: flowManager.isDevicesVisible
            }

            Settings {
                anchors.fill: parent
                visible: flowManager.isSettingsVisible
            }
        }

        Keys.onSpacePressed: {
            flowManager.goBack();
        }

        Keys.onBackPressed: {
            flowManager.goBack();
        }
    }
}
