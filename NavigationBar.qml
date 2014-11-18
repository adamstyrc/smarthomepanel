import QtQuick 2.0
import "img/"

Rectangle {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20*u
    z: 100
    color: "#303030"

    Image {
        height: parent.height
        width: 20*u
        visible: !flowManager.isDashboardVisible
        source: "img/previous_item"

        MouseArea {
            anchors.fill: parent
            onClicked: flowManager.goBack();
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Title"
    }
}
