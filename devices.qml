import QtQuick 2.0
import QtQuick.Window 2.1

Rectangle {
    width: 600
    height: 600

    ListView {
        id: listView
        anchors.fill: parent
        model: DeviceListTest {}
        delegate: listDelegate
    }

    Component {
        id: listDelegate

        Item {
            width: listView.width
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
}
