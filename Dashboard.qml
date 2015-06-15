import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 200
                color: "red"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showRooms();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Rooms"
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 200
                color: "blue"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showDevices();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Devices"
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 200
                color: "green"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showSettings();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Settings"
                }
            }
        }
    }
}
