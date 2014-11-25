import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import "Color.js" as Color
import "WebService.js" as WebService



Rectangle {
    id: root

    property int minWidth: 80
    property int cardWidth: 80

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentWidth: parent.width; contentHeight: grid.implicitHeight

        Flow {
            anchors.fill: parent

            id: grid

            ListModel{
                id: devices
            }

            function refresh() {
//                u = Math.floor(Screen.logicalPixelDensity)

                for(var i = grid.children.length; i > 0 ; i--) {
                  console.log("destroying: " + i)
                  grid.children[i-1].destroy()
                }

                var containerWidth = root.width;
                var columnsCount = Math.floor(containerWidth / (minWidth * u));
                cardWidth = (containerWidth/ columnsCount);


                var lightCard = Qt.createComponent("LightCard.qml");
                var temperatureCard = Qt.createComponent("TemperatureCard.qml");

                lightCard.width = cardWidth;
                lightCard.height = cardWidth;
                temperatureCard.width = cardWidth;
                temperatureCard.height = cardWidth;

                for (var i = 0; i < devices.count; i++) {
                     var item = devices.get(i);

                     var component;
                     if (item.typeId == 1) {
                         var object = temperatureCard.createObject(grid);
                         object.value = item.value;
                     } else {
                         var object = lightCard.createObject(grid);
                         object.value = item.value == 1;
                     }

//                     object.width = cardWidth;
//                     object.height = cardWidth;
                 }
            }
        }
    }

    Component.onCompleted: {
//        u = Math.floor(Screen.logicalPixelDensity)

//        var containerWidth = root.width;
//        var columnsCount = Math.floor(containerWidth / (minWidth * u));
//        cardWidth = (containerWidth/ columnsCount);
    }


    Screen.onHeightChanged: {
        console.log("onHeightChanged " + Screen.logicalPixelDensity + " " + Screen.pixelDensity);

        var containerWidth = Screen.width;
        var columnsCount = Math.floor(containerWidth / (minWidth * u));
        cardWidth = (containerWidth/ columnsCount);
    }

    onVisibleChanged: {
        console.log("Item.onVisibleChanged " + visible);

        if (visible) {
            WebService.getDevicesForRoom(settings.hostname, flowManager.itemId, function(resp) {
                devices.clear();
                for(var i = 0; i < resp.length; i++) {
                    console.log("elem" + i)
                    devices.append(resp[i]);
                    console.log(resp[i].name);
                }

                grid.refresh();
            })
        }
    }
}
