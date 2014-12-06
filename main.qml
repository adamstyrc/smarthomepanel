import QtQuick 2.0
import QtQuick.Window 2.1
import Qt.labs.settings 1.0

Window {
    id: root
    width: 600
    height: 600
    visible: true

    property int u: 1

    FlowManager {
        id: flowManager
    }

    Settings {
        id: settings
        property string login: ""
        property string password: ""

        property string ip: "192.168.0.13"
        property string port: "5000"
        property string hostname: "http://" + ip + ":" + port

        onHostnameChanged: {
            console.log("kurwa zmiana " + hostname)
        }
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

            SettingsView {
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

    Component.onDestruction: {
        console.log("hostname: " + settings.hostname);
    }
}
