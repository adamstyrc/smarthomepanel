import QtQuick 2.0

Rectangle {
    color: "#5e5751"

    ListView {
        id: listView
        anchors.fill: parent
        model: deviceTypes
        delegate: listDelegate
        spacing: 2*u
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

    DeviceTypesModel {
        id: deviceTypes
    }

}
