import QtQuick 2.0

QtObject {
    property bool isDashboardVisible: true
    property bool isRoomsVisible: false
    property bool isDevicesVisible: false
    property bool isSettingsVisible: false

    property bool isTopLevel: true

    function goBack() {
//        isDashboardVisible = !isDashboardVisible;
//        isRoomsVisible = !isRoomsVisible;

        if (!isTopLevel) {
            isTopLevel = true;
        } else if (!isDashboardVisible) {
            isRoomsVisible = false;
            isDevicesVisible = false;
            isSettingsVisible = false;
            isDashboardVisible = true;
            return false;
        } else {
            Qt.quit();
            return true;
        }
    }

    function showRooms() {
        isRoomsVisible = true;
        isDashboardVisible = false;
    }

    function showDevices() {
        isDevicesVisible = true;
        isDashboardVisible = false;
    }

    function showSettings() {
        isSettingsVisible = true;
        isDashboardVisible = false;
    }

    function showItem() {
        isTopLevel = false;
    }

}
