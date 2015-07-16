import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import "Color.js" as Color
import "WebService.js" as WebService

Rectangle {
    id: root

    property int minWidth: 60
    property int cardWidth: 80

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentWidth: parent.width; contentHeight: grid.implicitHeight

        Flow {
            anchors.fill: parent

            id: grid

            ListModel {
                id: devices
            }

            function drawDevices() {
//                u = Math.floor(Screen.logicalPixelDensity)

                for(var i = grid.children.length; i > 0 ; i--) {
                  console.log("destroying: " + i)
                  grid.children[i-1].destroy()
                }

                var containerWidth = root.width;
                var columnsCount = Math.floor(containerWidth / (minWidth * u));
                cardWidth = (containerWidth / columnsCount);


                var lightCard = Qt.createComponent("LightCard.qml");
                var temperatureCard = Qt.createComponent("TemperatureCard.qml");

                for (var i = 0; i < devices.count; i++) {
                    var item = devices.get(i);

                    var object;

                     if (item.typeId == 1) {
                         object = lightCard.createObject(grid);
                         object._id = item._id;
                         object.name = item.name;
                         object.value = item.state === 1;
                     } else {
                         object = temperatureCard.createObject(grid);
                         object.name = item.name;
                         console.log("ACHTUNG", item.name + " " + item.state);
                         object.value = item.state;
                     }
                 }
            }
        }
    }


    Screen.onHeightChanged: {
        console.log("onHeightChanged " + Screen.logicalPixelDensity + " " + Screen.pixelDensity);

        var containerWidth = Screen.width;
        var columnsCount = Math.floor(containerWidth / (minWidth * u));
        cardWidth = (containerWidth/ columnsCount);
    }

    onVisibleChanged: refresh();

    function refresh() {
        WebService.getDevicesForRoom(settings.hostname, flowManager.itemId, function(resp) {
            devices.clear();
            for(var i = 0; i < resp.length; i++) {
                devices.append(resp[i]);
                console.log(resp[i].name);
            }

            grid.drawDevices();
        },
        function(err) {
            console.log(err);
            })
    }
}
