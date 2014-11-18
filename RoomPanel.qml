import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Rectangle {
    id: root
//    width: 600
//    height: 600
    color: "#6d625c"
    anchors.fill: parent

    property int minWidth: 80
    property int cardWidth: 80

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentWidth: parent.width; contentHeight: grid.implicitHeight

        Flow {
            anchors.fill: parent

            id: grid

            DeviceListTest{
                id: devices
            }

            Component.onCompleted: {
//                u = Math.floor(Screen.logicalPixelDensity)

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
                     if (item.type == 1) {
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


//            Repeater {
//                model: DeviceListTest {}

//                LightCard {
//                    width: cardWidth
//                    height: cardWidth
//                    value: type == 1
//                }
//            }

//            Repeater {
//                model: DeviceListTest {}

//                TemperatureCard {
//                    width: cardWidth
//                    height: cardWidth
//                    value: type == 1
//                }

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

}
