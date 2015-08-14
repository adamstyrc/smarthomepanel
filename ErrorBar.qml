import QtQuick 2.0

Rectangle {
    anchors.top: parent.top
    height: visible ? 16*u : 0
    width: parent.width
    color: "#AE1A1A"
    visible: error !== ""
    z: 2

    property string error: ""

    Text {
        anchors.centerIn: parent
        text: error
//        color: "black"
    }

    function clear() {
        error = "";
    }
}
