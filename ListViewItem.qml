import QtQuick 2.0

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
        color: "lightGray"
        border.color: "black"
        border.width: 1

        Text {
            anchors.centerIn: parent
            text: name;
            font.pixelSize: 30
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
