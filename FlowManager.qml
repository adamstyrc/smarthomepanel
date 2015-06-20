import QtQuick 2.0

Item {
    property bool isTopLevel: true

    property int itemId: -1

    property string title: "Smart Home Panel"

    function goBack() {
        if (isTopLevel) {
            if (stackView.depth > 1) {
                stackView.pop();
            } else {
                Qt.quit();
            }
        } else {
            isTopLevel = true;
        }
    }

    function showRooms() {
        stackView.push(roomsViewComponent);
    }

    function showDevices() {
        stackView.push(devicesViewComponent);
    }

    function showSettings() {
        stackView.push(settingsViewComponent);
    }

    function showAddRoom() {
        stackView.push(addRoomViewComponent);
    }

    function showItem(index) {
        itemId = index;
//        setTitle();
        isTopLevel = false;
    }

    DeviceTypesModel {
        id: deviceTypes
    }

}
