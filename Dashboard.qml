import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1


Rectangle {
    id: root
    width: 600
    height: 600
    visible: true


    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            width: root.width
            height: 200
            color: "red"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    flowManager.showRooms();
//                    root.close();
//                    var component = Qt.createComponent("main.qml");
//                    var window = component.createObject(this);
//                    window.show();
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Rooms"
            }
        }

        Rectangle {
            width: root.width
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
            width: root.width
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
