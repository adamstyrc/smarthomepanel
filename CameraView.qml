import QtQuick 2.1
//import QtWebKit 3.0
import QtMultimedia 5.0



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


//        Video {
//            id: video
//            anchors.fill: parent
//            source: "http://192.168.1.80:8080/stream/video.mjpeg"
//        }

//        MediaPlayer {
//            id: player
//            source: "http://172.16.0.105:8888/stream.ogv"
//            autoPlay: true
//        }
    
//        VideoOutput {
//            id: videoOutput
//            source: player
//            anchors.fill: parent
//        }
    
//        WebView {
//            id: webview
////            url: "http://172.16.0.104/live/test.m3u8"
//            url: "http://172.16.0.105:8080"
////            url: "http://youtube.com"
//            anchors.fill: parent
//        }

//        WebEngineView {
//            url: "http://172.16.0.104"
//            anchors.fill: parent
//        }
    }
}
