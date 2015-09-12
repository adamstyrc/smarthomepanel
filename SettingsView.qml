import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import "js/Color.js" as Color
import "js/WebService.js" as WebService
import "js/Dimension.js" as Dimension



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


        Rectangle {
            id: formContainer
            anchors.top: errorBar.bottom
            anchors.topMargin: Dimension.SPACING*u
            width: parent.width
            height: form.height + 2*Dimension.SPACING*u
            color: Color.COMPONENT_BACKGROUND

            Column {
                id: form
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Dimension.SPACING*u
                spacing: Dimension.SPACING*u

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtLogin
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Login"
                        width: Dimension.FORM_LABEL_WIDTH*u
                    }

                    ShpTextField {
                        id: tfLogin
                        anchors.right: parent.right
                        anchors.left: txtLogin.right
                        anchors.leftMargin: Dimension.SPACING*u
                        anchors.verticalCenter: parent.verticalCenter
                        text: settings.login
                        onTextChanged: {
                            settings.login = text
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtPassword
                        anchors.verticalCenter: parent.verticalCenter
                        width: Dimension.FORM_LABEL_WIDTH*u
                        text: "Password"
                    }

                    ShpTextField {
                        id: tfPassword
                        anchors.right: parent.right
                        anchors.left: txtPassword.right
                        anchors.leftMargin: Dimension.SPACING*u
                        anchors.verticalCenter: parent.verticalCenter
                        echoMode: TextInput.Password
                        text: settings.password
                        onTextChanged: {
                            settings.password = text
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtIp
                        anchors.verticalCenter: parent.verticalCenter
                        width: Dimension.FORM_LABEL_WIDTH*u
                        text: "Ip"
                    }

                    ShpTextField {
                        id: tfIp
                        anchors.right: parent.right
                        anchors.left: txtIp.right
                        anchors.leftMargin: Dimension.SPACING*u
                        anchors.verticalCenter: parent.verticalCenter
                        text: settings.ip
                    }
                }

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtPort
                        anchors.verticalCenter: parent.verticalCenter
                        width: Dimension.FORM_LABEL_WIDTH*u
                        text: "Port"
                    }

                    ShpTextField {
                        id: tfPort
                        anchors.right: parent.right
                        anchors.left: txtPort.right
                        anchors.leftMargin: Dimension.SPACING*u
                        anchors.verticalCenter: parent.verticalCenter
                        text: settings.port
                    }
                }
            }
        }

        Rectangle {
            anchors.top: formContainer.bottom
            anchors.topMargin: Dimension.SPACING*u
            width: parent.width
            height: 32*u
            color: confirmMouseArea.pressed ? Color.MENU_BACKGROUND : Color.COMPONENT_BACKGROUND

            ShpLightText {
                anchors.centerIn: parent
                text: "Confirm"
            }

            MouseArea {
                id: confirmMouseArea
                anchors.fill: parent
                onClicked: {
                    WebService.getAuthenticated("http://" + tfIp.text + ":" + tfPort.text,
                                                function(resp) {
                                                    settings.ip = tfIp.text;
                                                    settings.port = tfPort.text;
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
