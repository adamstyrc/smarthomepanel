import QtQuick 2.0
import "WebService.js" as WebService
import "Dimension.js" as Dimension

Rectangle {
    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: Dimension.SPACING*u
        model: devices
        delegate: listDelegate
        spacing: Dimension.LIST_SPACING*u

        onDragEnded: {
            if (atYBeginning) {
                console.log("PullToRefresh:")
                refreshUI();
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
        console.log("DFTL.onVisibleChanged " + visible);
    }

    function refresh(selectedId) {
        WebService.getDevicesForType(settings.hostname, selectedId, function(resp) {
            devices.clear();
            for(var i = 0; i < resp.length; i++) {
                resp[i].deviceState = resp[i].state;
                devices.append(resp[i]);
                console.log(resp[i].name);
            }
        })
    }
}
