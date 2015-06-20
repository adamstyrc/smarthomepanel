//var BASE = "";

function request(BASE, verb, endpoint, obj, cb) {
    print('request: ' + verb + ' ' + BASE + (endpoint ? ('/' + endpoint) : ''))
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        print('xhr: on ready state change: ' + xhr.readyState)
        if(xhr.readyState === XMLHttpRequest.DONE) {
            if(cb) {
                console.log(xhr.responseText);
                var res = JSON.parse(xhr.responseText.toString());
                cb(res);
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

function putDeviceState(BASE, device, callback) {
    request(BASE, 'PUT', 'devices/state', device, callback)
}
