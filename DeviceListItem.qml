import QtQuick 2.5
import "Color.js" as Color
import "Dimension.js" as Dimension
import "WebService.js" as WebService
import "js/Utils.js" as Utils



Item {
    id: deviceItem
    width: parent.width
    height: 30*u

    property bool deviceEnabled: deviceState === 1
    property string deviceValue: "" + value
    property string devicetype: typeId

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
            height: 16*u
            width: 16*u
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: Dimension.SPACING*u
            source: Utils.pickIconForDevice(typeId, state)
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }

        ShpLightText {
            anchors.left: image.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: Dimension.SPACING*u
            text: name;
            font.pixelSize: 10*u
        }


        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                if (Utils.isDeviceChangable(devicetype)) {
                    progress.visible = true;

                    var device = {};
                    device._id = _id;
                    device.state = deviceEnabled ? 0 : 1;

                    console.log("Setting device " + device._id + " to state:" + device.state)
                    WebService.putDeviceState(settings.hostname, device, function(resp) {
                        deviceValue = Utils.makeString(resp.state);
                        deviceEnabled = resp.state === 1;

                        image.source = Utils.pickIconForDevice(resp.typeId, deviceValue);
                        progress.visible = false;
                    });
                }
            }

            onPressAndHold: {
                flowManager.showEditDevice(_id);
            }
        }
    }
}
