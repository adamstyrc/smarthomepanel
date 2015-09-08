import QtQuick 2.5
import "Color.js" as Color

Rectangle {
    id: tabView
    height: 20*u
    z: 2

    color: Color.WHITE

    property int selectedId: 1;

    Rectangle {
        id: topStripe
        height: 1
        anchors.top: parent.top
    }

    Rectangle {
        id: bottomStripe
        height: 1
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: tabSpace
        color: Color.LIGHT_GREEN
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
                    color: Color.LIGHT_GREEN

                    ShpLightText {
                        color: Color.BLACK
                        text: qsTr(name)
                        anchors.centerIn: parent
                        font.pixelSize: 7*u
                    }

//                    Text {
//                        color: Color.BLACK
//                        text: qsTr(name)
//                        anchors.centerIn: parent
//                        font.pixelSize: 7*u
//                        font.capitalization: Font.AllUppercase
//                        font.family: nexaLight.name
//                    }


                    Rectangle {
                        id: bottomHighlight
                        height: 2*u
                        width: parent.width
                        anchors.bottom: parent.bottom
                        color: Color.LIGHT_GREEN

                        visible: selectedId == _id

                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height
                            source: "qrc:/img/img/tab_triangle.png"
                            fillMode: Image.PreserveAspectFit
                        }
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
