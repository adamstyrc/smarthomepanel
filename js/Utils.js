
function pickIconForDevice(typeId, value) {
    switch (typeId) {
    case "1":
        var state = parseInt(value);
        return state === 1 ? "qrc:/img/img/icon_light_on.png" : "qrc:/img/img/icon_light_off.png"
    case "2":
        return "qrc:/img/img/icon_termometer.png";
    default:
        return "";
    }
}

function isDeviceChangable(typeId) {
    return typeId === "1";
}

function makeString(value) {
    return "" + value;
}
