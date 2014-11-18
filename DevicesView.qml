import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    DeviceTypesList {
        anchors.fill: parent
        color: Color.COMPONENT_BACKGROUND
        visible: flowManager.isTopLevel
    }

    DevicesForTypeList {
        anchors.fill: parent
        color: Color.BACKGROUND
        visible: !flowManager.isTopLevel
    }
}
