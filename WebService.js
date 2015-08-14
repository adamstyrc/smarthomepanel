//var BASE = "";

function request(BASE, verb, endpoint, obj, onSuccess, onError) {
    print('request: ' + verb + ' ' + BASE + (endpoint ? ('/' + endpoint) : ''))
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        print('xhr: on ready state change: ' + xhr.readyState)
        if(xhr.readyState === XMLHttpRequest.DONE) {
            console.log(xhr.status + " - " + xhr.responseText);
            var responseJson;
            if(xhr.status === 200 && onSuccess) {
                try {
                    responseJson = JSON.parse(xhr.responseText.toString());
                    onSuccess(responseJson);
                } catch(err) {
                    onSuccess();

                }
            } else if (onError) {
                if (xhr.responseText) {
                    responseJson = JSON.parse(xhr.responseText.toString());
                }

                if (xhr.status === 0) {
                    responseJson = ["Could not connect server!"];
                }

                onError(responseJson);
            }
        }
    }
    xhr.open(verb, BASE + (endpoint?'/' + endpoint:''));
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('Accept', 'application/json');
    var data = obj?JSON.stringify(obj):''
    console.log("Body: " + data);
    xhr.send(data)
}

function getAuthenticated(BASE, onSuccess, onError) {
    request(BASE, 'GET', "auth", null, onSuccess, onError);
}


function getDevicesForType(BASE, typeId, onSuccess, onError) {
    var endpoint = 'devices/type/';
    console.log("endpoint ", endpoint + typeId);
    request(BASE, 'GET', endpoint + typeId, null, onSuccess, onError)
}

function getDevicesForRoom(BASE, roomId, callback) {
    var endpoint = 'devices/room/';
    console.log("endpoint ", endpoint + roomId);
    request(BASE, 'GET', endpoint + roomId, null, callback)
}

function getDevice(BASE, deviceId, callback) {
    var endpoint = 'devices/';
    console.log("endpoint ", endpoint + deviceId);
    request(BASE, 'GET', endpoint + deviceId, null, callback)
}

function getRooms(BASE, onSuccess, onError) {
    request(BASE, 'GET', 'rooms', null, onSuccess, onError)
}

function postRoom(BASE, room, callback) {
    request(BASE, 'POST', 'rooms', room, callback)
}

function postDevice(BASE, device, onSuccess, onError) {
    request(BASE, 'POST', 'devices', device, onSuccess, onError)
}

function putDevice(BASE, device, onSuccess, onError) {
    request(BASE, 'PUT', 'devices', device, onSuccess, onError)
}

function putDeviceState(BASE, device, callback) {
    request(BASE, 'PUT', 'devices/state', device, callback)
}

function deleteDevice(BASE, device, callback) {
    console.log(device._id);
    var criteria = {}
    criteria._id = device._id;
    request(BASE, 'DELETE', 'devices/' + device._id, null, callback)
//    request(BASE, 'DELETE', 'devices', criteria, callback)
}
