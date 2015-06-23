import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Color.js" as Color
import "WebService.js" as WebService


Rectangle {
    anchors.fill: parent

    NavigationBar {
        id: navigationBar
        title: "New device"
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

              Component.onCompleted: {
                  WebService.getRooms(settings.hostname, function(resp) {
                      rooms.clear();
                      for(var i = 0; i < resp.length; i++) {
                          resp[i].text = resp[i].name;
                          rooms.append(resp[i]);
                          console.log(resp[i].name);
                      }
                  });
              }

              onActivated: {
                  var name = model.get(index).text;
                  console.log("onActivated " + index + " _id:" + name);
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
                        var device = {}
                        device.name = tfDeviceName.text;
                        device.ip = tfDeviceIp.text;
                        var selectedType = types.get(cbDeviceType.currentIndex)
                        device.typeId = selectedType._id;
                        var selectedRoom = rooms.get(cbDeviceRoom.currentIndex)
                        device.roomId = selectedRoom._id;

                        WebService.postDevice(settings.hostname, device,
                                              function(resp) {
                                                  errorBar.error = ""
                                                  flowManager.goBack();
                                              },
                                              function(resp) {
//                                                  for (var i = 0; i < resp.length; i++) {
//                                                      resp[i]
//                                                  }

                                                  errorBar.error = resp[0];
                                              });
                    }
                }
            }
        }
    }
}
