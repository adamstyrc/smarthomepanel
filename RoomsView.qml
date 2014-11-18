import QtQuick 2.0

Rectangle {

    RoomsList {
        visible: flowManager.isTopLevel
    }

    RoomPanel {
        visible: !flowManager.isTopLevel
    }
}
