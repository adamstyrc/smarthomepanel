import QtQuick 2.0

Rectangle {

    signal refreshUI;

    Timer {
        interval: 3000
        repeat: true
//        running: parent.visible
        onTriggered: refreshUI();
    }
}
