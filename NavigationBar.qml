import QtQuick 2.5
import "Color.js" as Color

Rectangle {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 24*u
    z: 100

    color: Color.MENU_BACKGROUND

    property string title: "Smart Home Panel"

    SquareImage {
        height: parent.height
        width: parent.height
        imgSource: "qrc:/img/img/icon_up.png"
        imgFill: 0.30
        visible: stackView.depth > 1

        MouseArea {
            anchors.fill: parent
            onClicked: flowManager.goBack();
        }
    }

//    Image {
//        height: parent.height
//        width: parent.height
//        anchors.verticalCenter: parent.verticalCenter
//        visible: stackView.depth > 1
//        source: "qrc:/img/img/icon_up.png"
//        fillMode: Image.Pad
//        mipmap: true
//        antialiasing: true

//        MouseArea {
//            anchors.fill: parent
//            onClicked: flowManager.goBack();
//        }
//    }

    Text {
        anchors.centerIn: parent
        color: Color.MENU_CONTRAST
        text: title
        font.pixelSize: 8*u
        font.family: nexaBold.name
        font.capitalization: Font.AllUppercase
    }
}
