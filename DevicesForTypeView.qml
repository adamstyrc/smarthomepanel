import QtQuick 2.5
import "WebService.js" as WebService
import "Dimension.js" as Dimension
import "js/Utils.js" as Utils

Rectangle {
    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: Dimension.SPACING*u
        model: devices
        delegate: lightListDelegate
        spacing: Dimension.LIST_SPACING*u

        onDragEnded: {
            if (atYBeginning) {
                console.log("PullToRefresh:")
                refreshUI();
            }
        }
    }

    Component {
        id: lightListDelegate

        DeviceListItem {
            OnOffButton {
                id: toggleButton
                width: 20*u
                height: 12*u
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: Dimension.SPACING*u
                checked: deviceEnabled
            }
        }
    }

    Component {
        id: sensorListDelegate

        DeviceListItem {
            id: deviceItem

            ShpLightText {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: Dimension.SPACING*u
                text: deviceItem.deviceValue
                font.pixelSize: 12*u
            }
        }
    }


    DeviceListTest {
        id: devices
    }

    DeviceTypesModel {
        id: deviceTypes
    }

    function refresh(selectedId) {
        listView.delegate = selectedId === 1 ? lightListDelegate : sensorListDelegate
        WebService.getDevicesForType(settings.hostname, selectedId,
                                     function(resp) {
                                         devices.clear();
                                         for(var i = 0; i < resp.length; i++) {
                                            resp[i].deviceState = resp[i].state;
                                             resp[i].value = Utils.makeString(resp[i].state);
                                            devices.append(resp[i]);
                                            console.log(resp[i].name);

                                             errorBar.clear();
                                         }
                                     },
                                         function(error) {
                                             errorBar.error = error[0];
                                             devices.clear();
                                         });
    }
}
