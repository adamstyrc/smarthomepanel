import QtQuick 2.0
import "WebService.js" as WebService

Item {
    property string loadingDeviceId : "";
    property var device;
    property var rooms;

    property int selectedRoomIndex : 0;
    property bool isEdition : !(loadingDeviceId === "1")

    function load(callback) {
//        loadingDeviceId = deviceId;

        WebService.getRooms(settings.hostname, function(resp) {
            rooms = resp;

            var isLoadingDevice = loadingDeviceId !== ""
            console.log("Is loading device: " + isLoadingDevice + " | " + loadingDeviceId);
            if (isLoadingDevice) {
                WebService.getDevice(settings.hostname, loadingDeviceId, function(resp) {
                    console.log("Device response: " + resp);
                    device = resp;
                    selectedRoomIndex = findRoomIndex();
                    callback();
                });
            } else {
                device = {
                    name: "",
                    IP: ""
                }
                callback();
            }
        });
    }


    function setDeviceId(deviceId) {
        loadingDeviceId = deviceId;
    }

    function findRoomIndex() {
        for (var i = 0; i < rooms.length; i++) {
            if (rooms[i]._id === device.roomId) {
                return i;
            }
        }

        return 0;
    }

    function save(device, onSuccess, onError) {
        if (loadingDeviceId === "") {
            WebService.postDevice(settings.hostname, device, onSuccess, onError);
        } else {
            WebService.putDevice(settings.hostname, device, onSuccess, onError);
        }
    }
}
