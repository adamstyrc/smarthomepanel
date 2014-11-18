import QtQuick 2.0
import QtQuick.Window 2.1

Window {
    id: root
    width: 600
    height: 600
    visible: true

    property int u: 1

    Rectangle {
        anchors.fill: parent
        focus: true

        Component.onCompleted: {
            u = Math.floor(Screen.logicalPixelDensity)
        }

        FlowManager {
            id: flowManager
        }

        Dashboard {
            id: dashboard
            anchors.fill: parent
            visible: flowManager.isDashboardVisible
        }

        RoomsView {
            anchors.fill: parent
            visible: flowManager.isRoomsVisible
        }

        RoomsList {
            anchors.fill: parent
            visible: flowManager.isDevicesVisible
        }

        Keys.onSpacePressed: {
            flowManager.goBack();
        }

        Keys.onBackPressed: {
            flowManager.goBack();
        }

    }
}
