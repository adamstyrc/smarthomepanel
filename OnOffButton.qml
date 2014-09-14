import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Button {
    text: checked ? "On" : "Off"

    checkable: true
    style: ButtonStyle {
       
        background: Rectangle {
            implicitWidth: 40
            implicitHeight: 25
            border.width: control.activeFocus ? 2 : 1
            border.color: checked ? "#303030" : "white"
            radius: 10

//            gradient: Gradient {
//                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
//                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
//            }
            color: control.checked ? "white" : "#303030"
           
        }
    }

    Text {
        anchors.centerIn: parent
        text: parent.text
        color: checked ? "#303030" : "white"
    }
}
