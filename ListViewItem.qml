import QtQuick 2.0
import "js/Color.js" as Color
import "js/Dimension.js" as Dimension


Item {
    id: listItem
    width: parent.width
    height: 30*u
//    opacity: mouseArea.pressed ? 0.5 : 1
    opacity: (listItem.width - listItem.x) / listItem.width

    property bool dragged: false
    property int positionStarted: 0

    Rectangle {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: (mouseArea.pressed || flowManager.itemId === _id) ? Color.PROGRESS : Color.COMPONENT_BACKGROUND

        ShpLightText {
            anchors.centerIn: parent
            text: name;
            font.pixelSize: 8*u
        }
    }
}
