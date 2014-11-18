import QtQuick 2.0
import "Color.js" as Color

Item {
    id: cardContent

    property int minWidth: 80
    property int minHeight: 80

    width: cardWidth
    height: cardWidth

    property bool value : true

    Rectangle {
        width: parent.width - 5*u
        height: parent.height - 5*u
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND

        Image {
            id: icon
            source: "img/light_icon"
            width: (parent.width - 5*u) / 2
            height: (parent.width - 5*u) / 2
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        OnOffButton {
            anchors.right: parent.right
            anchors.left: icon.right
            anchors.verticalCenter: parent.verticalCenter

            checked: value
        }
    }

    Component.onCompleted: {
//        var columnsCount = Math.floor(root.width / (minWidth * u));
//        width = (root.width / columnsCount) * u;
    }
}
