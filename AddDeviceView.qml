import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "js/Color.js" as Color
import "js/WebService.js" as WebService
import "js/Dimension.js" as Dimension


Rectangle {
    anchors.fill: parent

    Component.onCompleted: {
        deviceController.load(function() {
//            console.log("Loaded: " + deviceController.device.name)

            fillData();
        })
    }

    function fillData() {
        tfDeviceName.text = deviceController.device.name;
        tfDeviceIp.text = deviceController.device.ip;

        rooms.clear();
        var roomsList = deviceController.rooms;
        for(var i = 0; i < roomsList.length; i++) {
            roomsList[i].text = roomsList[i].name;
            rooms.append(roomsList[i]);
        }

        cbDeviceRoom.currentIndex = deviceController.selectedRoomIndex
    }

    NavigationBar {
        id: navigationBar
        title: "New device"

        SquareImage {
            height: parent.height - 4*u
            width: parent.height - 4*u
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 4*u
            imgSource: "qrc:/img/img/icon_remove.png"
            imgFill: 0.30

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    WebService.deleteDevice(settings.hostname, deviceController.device, function(resp) {
                        console.log("Deleted device " + resp)
                        flowManager.goBack();
                    });
                }
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom
        color: Color.BACKGROUND

        ErrorBar {
            id: errorBar
        }

        Rectangle {
            id: formContainer
            anchors.top: errorBar.bottom
            anchors.topMargin: Dimension.SPACING*u
            width: parent.width
            height: form.height + 2*Dimension.SPACING*u
            color: Color.COMPONENT_BACKGROUND

            Column {
                id: form
                anchors.top: parent.top
//                anchors.topMargin: Dimension.SPACING*u
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Dimension.SPACING*u
                spacing: Dimension.SPACING*u

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtDeviceName
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Name"
                    }

                    TextField {
                        id: tfDeviceName
                        anchors.right: parent.right
                        anchors.left: txtDeviceName.right
                        anchors.leftMargin: Dimension.SPACING*u
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtDeviceType
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Type"
                    }

                    ComboBox {
                      id: cbDeviceType
                      anchors.right: parent.right
                      anchors.left: txtDeviceType.right
                      anchors.leftMargin: Dimension.SPACING*u
                      anchors.verticalCenter: parent.verticalCenter
                      model: ListModel {
                            id: types
                            ListElement { text: "Light"; _id: "1"}
                            ListElement { text: "Thermometer"; _id: "2"}
                      }
                    }
                }

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtDeviceRoom
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Room"
                    }

                    ComboBox {
                      id: cbDeviceRoom
                      anchors.right: parent.right
                      anchors.left: txtDeviceRoom.right
                      anchors.leftMargin: Dimension.SPACING*u
                      anchors.verticalCenter: parent.verticalCenter
                      model: rooms

                      ListModel {
                          id: rooms
                          ListElement { text: "Room"; _id: "0"}
                      }

                      onActivated: {
                          var name = model.get(index).text;
                          console.log("onActivated " + index + " _id:" + name);

                          deviceController.selectedRoomIndex = index;
                      }
                    }
                }

                Row {
                    width: parent.width
                    height: 16*u

                    ShpLightText {
                        id: txtDeviceAddress
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Address"
                    }

                    TextField {
                        id: tfDeviceAddress
                        anchors.right: parent.right
                        anchors.left: txtDeviceAddress.right
                        anchors.leftMargin: Dimension.SPACING*u
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

            Rectangle {
                anchors.top: formContainer.bottom
                anchors.topMargin: Dimension.SPACING*u
                width: parent.width
                height: 32*u
                color: confirmMouseArea.pressed ? Color.MENU_BACKGROUND : Color.COMPONENT_BACKGROUND

                ShpLightText {
                    anchors.centerIn: parent
                    text: "Confirm"
                }

                MouseArea {
                    id: confirmMouseArea
                    anchors.fill: parent
                    onClicked: {
                        var device = deviceController.device;
                        device.name = tfDeviceName.text;
                        device.ip = tfDeviceAddress.text;
                        var selectedType = types.get(cbDeviceType.currentIndex)
                        device.typeId = selectedType._id;
                        var selectedRoom = rooms.get(cbDeviceRoom.currentIndex)
                        device.roomId = selectedRoom._id;

                        deviceController.save(device,
                                              function(resp) {
                                                  errorBar.error = "";
                                                  flowManager.goBack();
                                              },
                                              function(resp) {
                                                  errorBar.error = resp[0];
                                              });
                    }
                }
            }
        }
    }
}
