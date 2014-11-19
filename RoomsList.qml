import QtQuick 2.0

Rectangle {

    ListView {
        id: listView
        anchors.fill: parent
        model: rooms
        delegate: listDelegate
        spacing: u
    }

    Component {
        id: listDelegate

        ListViewItem {
            MouseArea {
                anchors.fill: parent
                onClicked: flowManager.showItem(index)
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
