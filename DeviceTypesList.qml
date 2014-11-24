import QtQuick 2.0
import "Dimension.js" as Dimension

Rectangle {
    color: "#5e5751"

    ListView {
        id: listView
        anchors.fill: parent
        model: deviceTypes
        delegate: listDelegate
        spacing: Dimension.SPACING*u
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
