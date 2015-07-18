import QtQuick 2.0
import "Color.js" as Color
import "Dimension.js" as Dimension
import "WebService.js" as WebService



Item {
    width: parent.width
    height: 30*u

    property bool value: deviceState === 1

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: mouseArea.pressed ? Color.PROGRESS : Color.COMPONENT_BACKGROUND

        Progress {
            id: progress
        }

        Image {
            id: image
            height: 24*u
            width: 24*u
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: Dimension.SPACING*u
            source: "img/light_icon"

//            MouseArea {
//                anchors.fill: parent
//                onClicked: flowManager.showAddRoom()
//            }
        }

        OnOffButton {
            width: 20*u
            height: 12*u
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: Dimension.SPACING*u
            checked: value

            Component.onCompleted: {
                console.log("state: " + state)
            }
        }

        Text {
            anchors.left: image.right
//            anchors.right: image.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: Dimension.SPACING*u
            text: name;
            font.pixelSize: 30
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                progress.visible = true;

                var device = {};
                device._id = _id;
                device.state = value ? 0 : 1;

                console.log("Setting device " + device._id + " to state:" + device.state)
                WebService.putDeviceState(settings.hostname, device, function(resp) {
                    value = resp.state === 1;
                    progress.visible = false;
                });
            }

            onPressAndHold: {
                flowManager.showEditDevice(_id);
            }
        }
    }
}
