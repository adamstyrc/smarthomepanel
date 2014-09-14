import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Window {
    width: 600
    height: 600
    id: root
    color: "#6d625c"
    visible: true

    property int u: 1
    property int minWidth: 80
    property int cardWidth: 80

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentWidth: parent.width; contentHeight: grid.implicitHeight

        Flow {
            anchors.fill: parent
            id: grid

            Repeater {
                model: DeviceListTest {}

                LightCard {
                    width: cardWidth
                    height: cardWidth
                    value: type == 1
                }
            }

            Repeater {
                model: DeviceListTest {}

                TemperatureCard {
                    width: cardWidth
                    height: cardWidth
                    value: type == 1
                }
            }
        }
    }

    Component.onCompleted: {
        u = Math.floor(Screen.logicalPixelDensity)

        var containerWidth = Screen.width;
        var columnsCount = Math.floor(containerWidth / (minWidth * u));
        cardWidth = (containerWidth/ columnsCount);
    }


    Screen.onHeightChanged: {
        console.log("onHeightChanged " + Screen.logicalPixelDensity + " " + Screen.pixelDensity);

        var containerWidth = Screen.width;
        var columnsCount = Math.floor(containerWidth / (minWidth * u));
        cardWidth = (containerWidth/ columnsCount);
    }

}
