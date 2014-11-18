import QtQuick 2.0

Rectangle {

    RoomsList {
        anchors.fill: parent
        visible: flowManager.isTopLevel
    }

    RoomPanel {
        anchors.fill: parent
        visible: !flowManager.isTopLevel
    }
}
