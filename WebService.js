//var BASE = "";

function request(BASE, verb, endpoint, obj, cb) {
    print('request: ' + verb + ' ' + BASE + (endpoint ? ('/' + endpoint) : ''))
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        print('xhr: on ready state change: ' + xhr.readyState)
        if(xhr.readyState === XMLHttpRequest.DONE) {
            if(cb) {
                var res = JSON.parse(xhr.responseText.toString())
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

function getDevices(BASE, callback) {
    request(BASE, 'GET', 'devices', null, callback)
}
