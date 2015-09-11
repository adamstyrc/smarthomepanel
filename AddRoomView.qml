import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "js/Color.js" as Color
import "js/WebService.js" as WebService


Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "New room"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom
        color: Color.BACKGROUND

        Grid {
            columns: 1
            spacing: 8
            anchors.centerIn: parent

            Label {
                text: "Name"
            }

            TextField {
                id: roomName
                Layout.fillWidth: true
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
                        var room = {}
                        room.name = roomName.text;

                        WebService.postRoom(settings.hostname, room, function(resp) {
                            console.log(resp);
                        });
//                        parent.color = "red"
//                        flowManager.goBack()
                    }
                }
            }
        }
    }
}
