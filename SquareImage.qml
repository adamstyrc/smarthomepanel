import QtQuick 2.5

Item {

    property string imgSource : ""
    property double imgFill: 1

    Image {
        anchors.centerIn: parent
        source: imgSource
        fillMode: Image.PreserveAspectFit
        height: imgFill * parent.height
//        width: (sourceSize.height > sourceSize.width) ? implicitWidth : imgFill * parent.width
        width: implicitWidth
        mipmap: true
        antialiasing: true

    }

}

