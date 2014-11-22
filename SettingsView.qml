import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Color.js" as Color
import "WebService.js" as WebService


Rectangle {
    color: Color.BACKGROUND

    Grid {
        columns: 1
        spacing: 8
        anchors.centerIn: parent

        Label {
            text: "Login"
        }

        TextField {
            id: login
            Layout.fillWidth: true
            text: settings.login
            onTextChanged: {
                settings.login = text
            }
        }

        Label {
            text: "Password"
        }

        TextField {
            id: password
            echoMode: TextInput.Password
            Layout.fillWidth: true
            text: settings.password
            onTextChanged: {
                settings.password = text
            }
            
        }

        Label {
            text: "Hostname"
        }

        TextField {
            id: hostname
            Layout.fillWidth: true
            text: settings.hostname
            onTextChanged: {
                settings.hostname = text
            }
        }
    }
}
