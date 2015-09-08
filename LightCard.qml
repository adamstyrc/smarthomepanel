import QtQuick 2.5
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
        color: Color.COMPONENT_BORDER

        Progress {
            id: progress
        }

        Rectangle {
            width: parent.width - 2
            height: parent.height - 2
            anchors.centerIn: parent
            color: Color.COMPONENT_BACKGROUND

            SquareImage {
                width: parent.width / 4
                height: parent.height / 4
                anchors.right: parent.right
                imgSource: value ? "qrc:/img/img/icon_on.png" : "qrc:/img/img/icon_off.png"
                imgFill: 0.5
            }


            Image {
                id: icon
                source: value ? "qrc:/img/img/icon_light_on.png" : "qrc:/img/img/icon_light_off.png"
//                width: (parent.width - 5*u) / 2
                height: parent.height / 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.4
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                mipmap: true
            }

            ShpLightText {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.2
                text: name
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

                onPressAndHold: {
                    flowManager.showEditDevice(_id);
                }
            }
        }
    }
}
