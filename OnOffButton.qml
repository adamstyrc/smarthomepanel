import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "Color.js" as Color

Button {
    text: checked ? "On" : "Off"

    checkable: true
    style: ButtonStyle {
       
        background: Rectangle {
            implicitWidth: 40
            implicitHeight: 25
            border.width: control.activeFocus ? 2 : 1
            border.color: checked ? Color.MENU_BACKGROUND : Color.MENU_CONTRAST
            radius: 10

//            gradient: Gradient {
//                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
//                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
//            }
            color: control.checked ? Color.MENU_CONTRAST : Color.MENU_BACKGROUND
           
        }
    }

    Text {
        anchors.centerIn: parent
        text: parent.text
        color: checked ? Color.MENU_BACKGROUND  : Color.MENU_CONTRAST
    }
}
