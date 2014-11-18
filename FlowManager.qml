import QtQuick 2.0

Item {
    property bool isDashboardVisible: true
    property bool isRoomsVisible: false
    property bool isDevicesVisible: false
    property bool isSettingsVisible: false

    property bool isTopLevel: true

    property int itemId: -1

    property string title: "Smart Home Panel"

    function goBack() {
//        isDashboardVisible = !isDashboardVisible;
//        isRoomsVisible = !isRoomsVisible;

        if (!isTopLevel) {
            isTopLevel = true;
            itemId = -1;
        } else if (!isDashboardVisible) {
            isRoomsVisible = false;
            isDevicesVisible = false;
            isSettingsVisible = false;
            isDashboardVisible = true;
        } else {
            Qt.quit();
        }

        setTitle();
    }

    function showRooms() {
        isRoomsVisible = true;
        isDashboardVisible = false;

        setTitle();
    }

    function showDevices() {
        isDevicesVisible = true;
        isDashboardVisible = false;

        setTitle();
    }

    function showSettings() {
        isSettingsVisible = true;
        isDashboardVisible = false;

        setTitle();
    }

    function showItem(index) {
        isTopLevel = false;
        itemId = index;

        setTitle();
    }

    function setTitle() {
        console.log("setTitle");
        if (isDashboardVisible) {
            title = "Smart Home Panel"
        } else if (isRoomsVisible) {
            if (isTopLevel) {
                title = "Rooms";
            } else {
                title = itemId;
            }
        } else if (isDevicesVisible) {
            if (isTopLevel) {
                title = "Devices";
            } else {
                title = deviceTypes.get(itemId).name;
            }
        } else if (isSettingsVisible) {
            if (isTopLevel) {
                title = "Settings";
            }
        }
    }

    DeviceTypesModel {
        id: deviceTypes
    }

}
