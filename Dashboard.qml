import QtQuick 2.5
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import "js/Color.js" as Color

Rectangle {
    anchors.fill: parent

    property int cardWidth: 80*u

    NavigationBar {
        id: navigationBar
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom
        color: Color.BACKGROUND

        Grid {
            id: grid
            columns: 2
            spacing: 20
            anchors.centerIn: parent


            Card {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showRooms();
                    }
                }

                Image {
                    id: roomsImage
                    width: 30*u
                    height: 35*u
                    mipmap: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/img/icon_rooms.png"
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Color.LIGHT_BLUE
                    text: "R O O M S"

                    font.pixelSize: 4*u
                    font.family: nexaBold.name
                }
            }


            Card {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showDevices();
                    }
                }

                Image {
                    id: devicesImage
                    width: 30*u
                    height: 35*u
                    mipmap: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/img/icon_devices.png"
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Color.LIGHT_GREEN
                    text: "D E V I C E S"

                    font.pixelSize: 4*u
                    font.family: nexaBold.name
                }
            }

            Card {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showSettings();
                    }
                }

                Image {
                    id: settingsImage
                    width: 30*u
                    height: 30*u
                    mipmap: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/img/icon_settings.png"
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Color.LIGHT_GRAY
                    text: "S E T T I N G S"

                    font.pixelSize: 4*u
                    font.family: nexaBold.name
                }
            }

            Card {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showCamera();
                    }
                }

                Image {
                    id: cameraImage
                    width: 35*u
                    height: 30*u
                    mipmap: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/img/img/icon_camera.png"
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20*u
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Color.LIGHT_RED
                    text: "C A M E R A"

                    font.pixelSize: 4*u
                    font.family: nexaBold.name
                }
            }
        }
    }

    function adjustCardSize() {
        var containerWidth = grid.parent.width;
        cardWidth = containerWidth / 3;

        if (cardWidth < 80) {
            cardWidth = 80;
        }
    }
}
