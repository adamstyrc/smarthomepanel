import QtQuick 2.0
import "Color.js" as Color

Rectangle {

    RoomsList {
        anchors.fill: parent
        color: Color.COMPONENT_BACKGROUND
        visible: flowManager.isTopLevel
    }

    RoomPanel {
        anchors.fill: parent
        color: Color.BACKGROUND
        visible: !flowManager.isTopLevel
    }
}
