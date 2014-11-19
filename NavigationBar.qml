import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20*u
    z: 100
    color: Color.MENU_BACKGROUND

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
        color: Color.MENU_CONTRAST
        text: flowManager.title
    }
}
