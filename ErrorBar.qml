import QtQuick 2.0

Rectangle {
    anchors.top: parent.top
    height: 16*u
    width: parent.width
    color: "#AE1A1A"
    visible: error !== ""

    property string error: ""

    Text {
        anchors.centerIn: parent
        text: error
//        color: "black"
    }
}
