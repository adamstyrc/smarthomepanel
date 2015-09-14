import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import "js/Color.js" as Color
import "js/WebService.js" as WebService

Rectangle {
    id: root

    property int minWidth: 80
    property int cardWidth: 0

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentWidth: parent.width; contentHeight: grid.implicitHeight

        Flow {
            anchors.fill: parent

            id: grid

            DeviceListTest {
                id: devices
            }

            function drawDevices() {
                for(var i = grid.children.length; i > 0 ; i--) {
                  console.log("destroying: " + i)
                  grid.children[i-1].destroy()
                }

                var containerWidth = root.width;
                var columnsCount = Math.floor(containerWidth / (minWidth * u));
                cardWidth = (containerWidth / columnsCount);


                var lightCard = Qt.createComponent("LightCard.qml");
                var temperatureCard = Qt.createComponent("TemperatureCard.qml");
                var alarmCard = Qt.createComponent("AlarmCard.qml");
                var kettleCard = Qt.createComponent("KettleCard.qml");

                for (var i = 0; i < devices.count; i++) {
                    var device = devices.get(i);

                    var object;

                    switch(device.typeId) {
                    case WebService.LIGHT_TYPE_ID:
                        object = lightCard.createObject(grid);
                        object.value = device.state === 1;
                        break;
                    case WebService.TERMOMETER_TYPE_ID:
                        object = temperatureCard.createObject(grid);
//                        object.value = device.state;
                        object.value = "23°C";
                        break;
                    case WebService.ALARM_TYPE_ID:
                        object = alarmCard.createObject(grid);
                        object.value = device.state === 1;
                        break;
                    case WebService.KETTLE_TYPE_ID:
                        object = kettleCard.createObject(grid);
                        object.value = device.state === 1;
                        break;
                    }

                    object._id = device._id;
                    object.name = device.name;
                 }
            }
        }

        onDragEnded: {
            if (atYBeginning) {
                console.log("PullToRefresh");
                refreshUI();
            }
        }
    }


//    Screen.onHeightChanged: {
//        console.log("onHeightChanged " + Screen.logicalPixelDensity + " " + Screen.pixelDensity);

//        var containerWidth = Screen.width;
//        var columnsCount = Math.floor(containerWidth / (minWidth));
//        cardWidth = (containerWidth / columnsCount);
//    }

    Component.onCompleted: {
        refresh();
    }

    function refresh() {
        WebService.getDevicesForRoom(settings.hostname, flowManager.itemId,
                                     function(resp) {
                                        devices.clear();
                                        for(var i = 0; i < resp.length; i++) {
                                            devices.append(resp[i]);
                                            console.log(resp[i].name);
                                            errorBar.clear();
                                        }
                                        grid.drawDevices();
                                    },
                                     function(error) {
                                         console.log("error" + error);
                                         errorBar.error = error[0];
                                         devices.clear();
                                     });
    }
}
