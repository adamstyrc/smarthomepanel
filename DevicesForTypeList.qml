import QtQuick 2.0

Rectangle {
    ListView {
        id: listView
        anchors.fill: parent
        model: devices
        delegate: listDelegate
//        header: header
        spacing: 4*u
    }

    Component {
        id: header

        Rectangle {
            height: 20*u
            width: listView.width
            color: "lightgreen"

            Text {
                anchors.centerIn: parent
                text: deviceTypes.get(flowManager.itemId).name
            }
        }
    }

    Component {
        id: listDelegate

        DeviceListItem {}
    }

    DeviceListTest {
        id: devices
    }

    DeviceTypesModel {
        id: deviceTypes
    }
}
