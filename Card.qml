import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    width: cardWidth
    height: cardWidth
    color: Color.COMPONENT_BORDER

    Rectangle {
        width: parent.width - 2
        height: parent.height - 2
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND
    }
}
