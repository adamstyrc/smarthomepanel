import QtQuick 2.0
import "WebService.js" as WebService
import "Dimension.js" as Dimension

Rectangle {
    ListView {
        id: listView
        anchors.fill: parent
        model: devices
        delegate: listDelegate
//        header: header
        spacing: Dimension.SPACING*u
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

    onVisibleChanged: {
        console.log("Item.onVisibleChanged " + visible);

        if (visible) {
            WebService.getDevices(settings.hostname, function(resp) {
                devices.clear();
                for(var i = 0; i < resp.length; i++) {
                    devices.append(resp[i]);
                    console.log(resp[i].name);
                }
            })
        }
    }
}
