import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "js/Color.js" as Color

TextField {
    font.family: nexaLight.name
    horizontalAlignment: TextInput.AlignHCenter

    style: TextFieldStyle {
        textColor: Color.LIGHT_GRAY
        background: Item {
            Rectangle {
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                color: Color.COMPONENT_BORDER
            }
        }
    }
}

