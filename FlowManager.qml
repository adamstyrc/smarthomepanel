import QtQuick 2.0
import "js/Controller.js" as Controller

Item {
    property string itemId: ""
    property bool isTopLevel: true;
    property bool isTwoPane: (stackView.width / u) > 320;
//    property bool isTwoPane: false;

    property int currentDepth : stackView.depth - 1;

    function goBack() {
        if (stackView.depth > 1) {
            if (isTopLevel) {
                stackView.pop();
                stackView.currentItem.refreshUI();
            } else {
                Controller.isTopLevels[currentDepth] = true;
                itemId = ""
                updateTopLevel();
            }
        } else {
            Qt.quit();
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

    function showCamera() {
        stackView.push(cameraViewComponent);
    }

    function showAddRoom() {
        deviceController.setDeviceId("");
        stackView.push(addDeviceViewComponent);
    }

    function showEditDevice(deviceId) {
        deviceController.setDeviceId(deviceId);
        stackView.push(addDeviceViewComponent);
    }

    function updateTopLevel() {
        isTopLevel = Controller.isTopLevels[currentDepth];
        console.log("topLevels: " + Controller.isTopLevels + " | depth: " + currentDepth);
    }

    function showItem(index) {
        itemId = index;
        Controller.isTopLevels[currentDepth] = false;
        updateTopLevel();
    }

    DeviceTypesModel {
        id: deviceTypes
    }

    onCurrentDepthChanged: updateTopLevel();
}
