import QtQuick 2.1
//import QtWebKit 3.0
import QtWebKit 1.0


import "Color.js" as Color

Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "Camera"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom
        color: Color.BACKGROUND


//        WebEngineView {
//            id: webview
//            url: "http://www.qt-project.org"
//            anchors.fill: parent
//        }

        WebView {
            id: webview
//            url: "http://172.16.0.105:8081/"
            url: "http://onet.pl"
            anchors.fill: parent
//            color: Color.COMPONENT_BACKGROUND
        }
    }
}
