import QtQuick 2.0
import "Color.js" as Color

Rectangle {
    width: cardWidth
    height: cardWidth
    color: Color.COMPONENT_BORDER

    Rectangle {
        width: cardWidth - 2
        height: cardWidth - 2
        anchors.centerIn: parent
        color: Color.COMPONENT_BACKGROUND
    }
}
