import QtQuick 2.0

Rectangle {

    ListView {
        id: listView
        anchors.fill: parent
        model: rooms
        delegate: listDelegate
    }

    Component {
        id: listDelegate

        Item {
            width: listView.width
            height: 100

            Rectangle {
                width: parent.width - 40
                height: parent.height - 40
                anchors.centerIn: parent
//                anchors.fill: parent
                color: "lightGray"
                border.color: "black"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: name;
                    font.pixelSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: flowManager.showItem(index)
                }
            }
        }
    }

    ListModel {
        id: rooms

        ListElement {
            name: "Room 1"
        }

        ListElement {
            name: "Room 2"
        }
        ListElement {
            name: "Room 2"
        }
    }
}
