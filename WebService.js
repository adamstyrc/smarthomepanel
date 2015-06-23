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
                responseJson = JSON.parse(xhr.responseText.toString());
                onSuccess(responseJson);
            } else if (onError) {
                if (xhr.responseText) {
                    responseJson = JSON.parse(xhr.responseText.toString());
                }

                onError(responseJson);
            }
        }
    }
    xhr.open(verb, BASE + (endpoint?'/' + endpoint:''));
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('Accept', 'application/json');
    var data = obj?JSON.stringify(obj):''
    xhr.send(data)
}


function getDevicesForType(BASE, typeId, callback) {
    var endpoint = 'devices/type/';
    console.log("endpoint ", endpoint + typeId);
    request(BASE, 'GET', endpoint + typeId, null, callback)
}

function getDevicesForRoom(BASE, roomId, callback) {
    var endpoint = 'devices/room/';
    console.log("endpoint ", endpoint + roomId);
    request(BASE, 'GET', endpoint + roomId, null, callback)
}

function getRooms(BASE, callback) {
    request(BASE, 'GET', 'rooms', null, callback)
}

function postRoom(BASE, room, callback) {
    request(BASE, 'POST', 'rooms', room, callback)
}

function postDevice(BASE, device, onSuccess, onError) {
    request(BASE, 'POST', 'devices', device, onSuccess, onError)
}

function putDeviceState(BASE, device, callback) {
    request(BASE, 'PUT', 'devices/state', device, callback)
}
