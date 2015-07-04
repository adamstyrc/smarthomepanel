import QtQuick 2.0
import "Color.js" as Color
Rectangle {
    id: tabView
    height: 20*u
    z: 2

    anchors.topMargin: 1
    color: Color.MENU_CONTRAST

    property int selectedId: 0;

    Rectangle {
        id: bottomStripe
        height: 1
        anchors.bottom: parent.bottom
        color: Color.MENU_CONTRAST
    }

    Rectangle {
        id: tabSpace
        color: Color.MENU_BACKGROUND
        anchors.top: tabView.top
        anchors.left: tabView.left
        anchors.right: tabView.right

        anchors.bottom: bottomStripe.top

        Row {

            Repeater {
                id: repeater
                model: 3

                Rectangle {
                    width: 40*u
                    height: tabSpace.height
                    color: Color.MENU_BACKGROUND

                    Text {
                        color: Color.MENU_CONTRAST
                        text: qsTr("Lights" + index)
                        anchors.centerIn: parent
                    }


                    Rectangle {
                        id: bottomHighlight
                        height: 2*u
                        width: parent.width
                        anchors.bottom: parent.bottom
                        color: Color.MENU_CONTRAST

                        visible: selectedId == index
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectedId = index
                        }
                    }
                }
            }
        }

    }

    onSelectedIdChanged: {
        console.log("Selected devices type: " + selectedId);
    }


}
