import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Color.js" as Color

Rectangle {
    color: Color.BACKGROUND

    Grid {
        columns: 2
        spacing: 8
        anchors.centerIn: parent

        Label {
            text: "Login"
        }

        TextField {
            id: login
            Layout.fillWidth: true
        }

        Label {
            text: "Password"
        }

        TextField {
            id: password
            echoMode: TextInput.Password
            Layout.fillWidth: true
            
        }

        Label {
            text: "Hostname"
        }

        TextField {
            id: hostname
            Layout.fillWidth: true
        }
    }
}
