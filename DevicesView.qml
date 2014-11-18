import QtQuick 2.0

Rectangle {
    DeviceTypesList {
        anchors.fill: parent
        visible: flowManager.isTopLevel
    }

    DevicesForTypeList {
        anchors.fill: parent
        visible: !flowManager.isTopLevel
    }
}
