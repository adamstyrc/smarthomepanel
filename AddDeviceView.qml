import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Color.js" as Color
import "WebService.js" as WebService


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

        Grid {
            columns: 1
            spacing: 8
            anchors.centerIn: parent

            Label {
                text: "Name"
            }

            TextField {
                id: tfDeviceName
                Layout.fillWidth: true
            }

            Label {
                text: "Type"
            }

            ComboBox {
              id: cbDeviceType
              width: 64*u
              model: ListModel {
               id: types
               ListElement { text: "Light"; _id: "1"}
               ListElement { text: "Thermometer"; _id: "2"}
             }

              onActivated: {
                  var typeId = model.get(index)._id;
                  console.log("onActivated " + index + " _id:" + typeId);
              }
            }

            Label {
                text: "Room"
            }

            ComboBox {
              id: cbDeviceRoom
              width: 64*u
              model: rooms

              ListModel {
                  id: rooms
                  ListElement { text: "Room"; _id: "0"}
              }

//              Component.onCompleted: {
//                  WebService.getRooms(settings.hostname, function(resp) {
//                      rooms.clear();
//                      for(var i = 0; i < resp.length; i++) {
//                          resp[i].text = resp[i].name;
//                          rooms.append(resp[i]);
//                          console.log(resp[i].name);
//                      }
//                  });
//              }

              onActivated: {
                  var name = model.get(index).text;
                  console.log("onActivated " + index + " _id:" + name);

                  deviceController.selectedRoomIndex = index;
              }
            }

            Label {
                text: "IP"
            }

            TextField {
                id: tfDeviceIp
                Layout.fillWidth: true
            }

            Rectangle {
                width: 64*u
                height: 16*u
                color: "green"

                Text {
                    text: "Confirm"
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var device = deviceController.device;
                        device.name = tfDeviceName.text;
                        device.ip = tfDeviceIp.text;
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
