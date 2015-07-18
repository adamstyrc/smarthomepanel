import QtQuick 2.0
import "Color.js" as Color
Rectangle {
    id: tabView
    height: 20*u
    z: 2

    color: Color.MENU_CONTRAST

    property int selectedId: 1;

    Rectangle {
        id: topStripe
        height: 1
        anchors.top: parent.top
        color: Color.MENU_CONTRAST
    }

    Rectangle {
        id: bottomStripe
        height: 1
        anchors.bottom: parent.bottom
        color: Color.MENU_CONTRAST
    }

    Rectangle {
        id: tabSpace
        color: Color.MENU_BACKGROUND
        anchors.top: topStripe.bottom
        anchors.left: tabView.left
        anchors.right: tabView.right

        anchors.bottom: bottomStripe.top

        Row {

            DeviceTypesModel {
                id: deviceTypesModel
            }

            Repeater {
                id: repeater
                model: deviceTypesModel

                Rectangle {
                    width: 40*u
                    height: tabSpace.height
                    color: Color.MENU_BACKGROUND

                    Text {
                        color: Color.MENU_CONTRAST
                        text: qsTr(name)
                        anchors.centerIn: parent
                    }


                    Rectangle {
                        id: bottomHighlight
                        height: 2*u
                        width: parent.width
                        anchors.bottom: parent.bottom
                        color: Color.MENU_CONTRAST

                        visible: selectedId == _id
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectedId = _id
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
