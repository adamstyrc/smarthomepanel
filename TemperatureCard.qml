import QtQuick 2.5
import "js/Color.js" as Color
import "js/Dimension.js" as Dimension


Item {
    id: cardContent

    width: cardWidth
    height: cardWidth

    property string _id : "_hash"
    property string name : "Thermometer"
    property string value : "-273°C"


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

            ShpLightText {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: 6*u
                anchors.topMargin: 6*u
                font.pixelSize: 12*u
                text: "34*C"
            }

            Image {
                id: icon
                source: "qrc:/img/img/icon_termometer.png"
//                width: (parent.width - 5*u) / 2
                height: parent.height / 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.4
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                mipmap: true
                antialiasing: true
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

                onPressAndHold: {
                    flowManager.showEditDevice(_id);
                }
            }
        }
    }
}
