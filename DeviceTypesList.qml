import QtQuick 2.0

Rectangle {
    color: "#5e5751"

    ListView {
        id: listView
        anchors.fill: parent
        model: deviceTypes
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

    DeviceTypesModel {
        id: deviceTypes
    }

}
