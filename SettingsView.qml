import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Color.js" as Color
import "WebService.js" as WebService



Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Settings"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom
        color: Color.BACKGROUND

        ErrorBar {
            id: errorBar
        }

        Grid {
            columns: 1
            spacing: 8
            anchors.centerIn: parent

            ShpLightText {
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

            ShpLightText {
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

            ShpLightText {
                text: "IP"
            }

            TextField {
                id: ip
                Layout.fillWidth: true
                text: settings.ip
//                onTextChanged: {
//                    if (visible) {
//                        settings.ip = String(text);
//                    }
//                }
            }

            ShpLightText {
                text: "Port"
            }

            TextField {
                id: port
                Layout.fillWidth: true
                text: settings.port
//                onTextChanged: {
//                    if (visible) {
//                        settings.port = String(text);
//                    }
//                }
            }

            Rectangle {
                width: 64*u
                height: 16*u
                color: "green"

                Text {
                    text: "Confirm"
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        WebService.getAuthenticated("http://" + ip.text + ":" + port.text,
                                                    function(resp) {
                                                        settings.ip = ip.text;
                                                        settings.port = port.text;
                                                        errorBar.error = "";
                                                        flowManager.goBack();
                                                    },
                                                    function(response) {
                                                        console.log("error" + response);
                                                        errorBar.error = response[0];
                                                    });
                    }
                }
            }
        }
    }
}
