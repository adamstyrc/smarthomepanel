import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 24*u
    z: 100

    color: Color.MENU_BACKGROUND

    property string title: "Smart Home Panel"

    Image {
        height: parent.height
        width: parent.height
        visible: stackView.depth > 1
        source: "img/previous_item"

        MouseArea {
            anchors.fill: parent
            onClicked: flowManager.goBack();
        }
    }

    Text {
        anchors.centerIn: parent
        color: Color.MENU_CONTRAST
        text: title
    }

    Image {
        height: parent.height - 4*u
        width: parent.height - 4*u
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 4*u
        visible: stackView.depth > 1
        source: "img/img/add.png"
    }
}
