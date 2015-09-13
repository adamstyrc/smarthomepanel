import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "js/Color.js" as Color

ComboBox {
    style: ComboBoxStyle {
        background: Item {

            SquareImage {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height
                width: parent.height
                imgSource: "qrc:/img/img/icon_select.png"
                imgFill: 0.80
            }

            Rectangle {
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                color: Color.COMPONENT_BORDER
            }
        }

        label: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: control.currentText
            color: Color.LIGHT_GRAY
        }
    }
}

