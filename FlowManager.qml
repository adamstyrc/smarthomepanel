import QtQuick 2.0
import "Controller.js" as Controller

Item {
    property string itemId: ""
    property bool isTopLevel: true;

    property int currentDepth : stackView.depth - 1;

    function goBack() {
        if (stackView.depth > 1) {
            if (isTopLevel) {
                stackView.pop();
            } else {
                Controller.isTopLevels[currentDepth] = true;
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

    function showAddRoom() {
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
