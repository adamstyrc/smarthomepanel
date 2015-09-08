import QtQuick 2.0
import "Color.js" as Color
import "Dimension.js" as Dimension


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
        color: mouseArea.pressed ? Color.PROGRESS : Color.COMPONENT_BACKGROUND

        ShpLightText {
            anchors.centerIn: parent
            text: name;
            font.pixelSize: 8*u
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: flowManager.showItem(_id)

        drag.target: listItem
        drag.axis: Drag.XAxis
        drag.minimumX: 0
        drag.maximumX: listItem.width

        onPressed: {
            console.log("pressed");
            dragged = true;
//                    positionStarted =
//                   listItem.opacity = 0.5;
        }

        onPressAndHold: {
            console.log("pressedAndHold");
        }

        onReleased: {
            console.log("released")
            dragged = false;
//                    listItem.opacity = 1;
        }
    }
}
