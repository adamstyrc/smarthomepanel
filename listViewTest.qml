import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    width: 600
    height: 600
    id: root

    PathView {
        anchors.fill: parent
        model: 100
        clip: false
        pathItemCount: 6
        delegate: flipCardDelegate
        highlightRangeMode: PathView.StrictlyEnforceRange
//        preferredHighlightBegin: PathView.ApplyRange
        path: Path {
            startX: -32; startY: 100
            PathQuad { x: 632; y: 100; controlX: 300; controlY: 200 }
        }
    }

    ListView {
        id: list
//        anchors.fill: parent
        anchors.bottom: parent.bottom
        anchors.top: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 50
        clip: false
        orientation: ListView.Horizontal
        model: 100
        delegate: listDelegate
        highlightRangeMode: ListView.StrictlyEnforceRange
        focus: true
        highlight: Rectangle {
            radius: 5
            color: "lightsteelblue"
            width: list.currentItem.width + 20
        }
    }

    Component {
        id: listDelegate

        Item {
            width: 64
            height: 64

            Rectangle {
                anchors.fill: parent
                color: "lightGray"
                border.color: "black"
                border.width: 3

                Text {
                    anchors.centerIn: parent
                    text: index
                    font.pixelSize: 30
                }
            }
        }
    }

    Component {
        id: flipCardDelegate

        Item {
            id: wrapper

//            scale: PathView.iconScale
//            opacity: PathView.iconOpacity

            width: 64
            height: 64

            visible: PathView.onPath

//            scale: PathView.itemScale
//            z: PathView.itemZ

//            property variant rotX: PathView.itemAngle
//            transform: Rotation { axis { x: 1; y: 0; z: 0 } angle: wrapper.rotX; origin { x: 32; y: 32; } }

            Rectangle {
                anchors.fill: parent
                color: "lightGray"
                border.color: "black"
                border.width: 3
            }

            Text {
                anchors.centerIn: parent
                text: index
                font.pixelSize: 30
            }
        }
    }
}
