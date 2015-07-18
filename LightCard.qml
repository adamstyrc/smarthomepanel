import QtQuick 2.0
import "Color.js" as Color
import "Dimension.js" as Dimension
import "WebService.js" as WebService



Item {
    id: cardContent

    width: cardWidth
    height: cardWidth

    property string _id : "_hash"
    property string name : "Light"
    property bool value : true

    Rectangle {
        width: parent.width - Dimension.SPACING*u
        height: parent.height - Dimension.SPACING*u
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND

        Progress {
            id: progress
        }

        Rectangle {
            width: parent.width - Dimension.SPACING*u
            height: parent.height - Dimension.SPACING*u
            anchors.centerIn: parent
            color: parent.color

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: name
            }

            Image {
                id: icon
                source: "img/light_icon"
                width: (parent.width - 5*u) / 2
                height: (parent.width - 5*u) / 2
                anchors.centerIn: parent
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    progress.visible = true

                    var device = {};
                    device._id = _id;
                    device.state = value ? 0 : 1;

                    console.log("Setting device " + device._id + " to state:" + device.state)
                    WebService.putDeviceState(settings.hostname, device, function(resp) {
                        value = resp.state === 1;
                        progress.visible = false;
                    });
                }

            }

            OnOffButton {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width / 2
                checked: value
            }
        }
    }
}
