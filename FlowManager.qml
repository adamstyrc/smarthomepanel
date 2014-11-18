import QtQuick 2.0

QtObject {
    property bool isDashboardVisible: true
    property bool isRoomsVisible: false
    property bool isDevicesVisible: false
    property bool isTopLevel: true
//    property bool isDashboardVisible: true
//    property bool isDashboardVisible: true

    function goBack() {
//        isDashboardVisible = !isDashboardVisible;
//        isRoomsVisible = !isRoomsVisible;

        if (!isTopLevel) {
            isTopLevel = true;
        } else if (!isDashboardVisible) {
            isRoomsVisible = false;
            isDevicesVisible = false;
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

    function showItem() {
        isTopLevel = false;
    }

}
