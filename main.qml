import QtQuick 2.0
import QtQuick.Window 2.1
import Qt.labs.settings 1.0
import QtQuick.Controls 1.2

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

        property string ip: "192.168.0.16"
        property string port: "3000"
        property string hostname: "http://" + ip + ":" + port

        onHostnameChanged: {
            console.log("Hostname changed: " + hostname)
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: dashboardComponent
        focus: true

        Component.onCompleted: {
            u = Math.floor(Screen.logicalPixelDensity)
        }

        Keys.onSpacePressed: {
            flowManager.goBack();
        }

        Keys.onBackPressed: {
            flowManager.goBack();
        }
    }

    Component {
        id: dashboardComponent

        Dashboard {}
    }

    Component {
        id: roomsViewComponent

        RoomsView {}
    }

    Component {
        id: devicesViewComponent

        DevicesView {}
    }

    Component {
        id: settingsViewComponent

        SettingsView {}
    }

    Component {
        id: addRoomViewComponent
        AddRoomView {}
    }

    Component {
        id: addDeviceViewComponent
        AddDeviceView {}
    }

    Component.onDestruction: {
        console.log("hostname: " + settings.hostname);
    }
}
