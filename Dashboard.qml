import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import "Color.js" as Color

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


            Rectangle {
                width: cardWidth
                height: cardWidth
                color: Color.COMPONENT_BACKGROUND

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
                width: cardWidth
                height: cardWidth
                color: Color.COMPONENT_BACKGROUND

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
                width: cardWidth
                height: cardWidth
                color: Color.COMPONENT_BACKGROUND

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

            Rectangle {
                width: cardWidth
                height: cardWidth
                color: Color.COMPONENT_BACKGROUND

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        flowManager.showCamera();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Camera"
                }
            }
        }
    }

    onHeightChanged: {
        console.log("onHeightChanged")
//        adjustCardSize();
    }

    Component.onCompleted: {
        console.log("onCompleted")
//        adjustCardSize();
    }

    function adjustCardSize() {
        var containerWidth = grid.parent.width;
        cardWidth = containerWidth / 3;

        if (cardWidth < 80) {
            cardWidth = 80;
        }
    }
}
