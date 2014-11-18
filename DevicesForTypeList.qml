import QtQuick 2.0

Rectangle {
    ListView {
        id: listView
        anchors.fill: parent
        model: devices
        delegate: listDelegate
//        header: header
        spacing: u
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

        Item {
            width: listView.width
            height: 30*u

            Rectangle {
                width: parent.width
                height: parent.height
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
//                    onClicked: flowManager.showItem()
                }
            }
        }
    }

    DeviceListTest {
        id: devices
    }

    DeviceTypesModel {
        id: deviceTypes
    }
}
