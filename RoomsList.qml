import QtQuick 2.0
import "Dimension.js" as Dimension
import "WebService.js" as WebService

Rectangle {

    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: Dimension.SPACING*u
        model: rooms
        delegate: listDelegate
        spacing: Dimension.LIST_SPACING*u
    }



    Component {
        id: listDelegate

        ListViewItem {
            id: itemOfList
        }
    }

    ListModel {
        id: rooms

        ListElement {
            name: "Room 1"
            _id: "a"
        }
    }

    onVisibleChanged: {
        console.log("RoomsList.onVisibleChanged " + visible);

        if (visible) {
            refreshData();
        }
    }

    Component.onCompleted: {
        console.log("RoomsList.onCompleted ");
        refreshData();
    }

    function refreshData() {
        WebService.getRooms(settings.hostname, function(resp) {
            rooms.clear();
            for(var i = 0; i < resp.length; i++) {
                rooms.append(resp[i]);
                console.log(resp[i].name);
                errorBar.error = "";
            }
        },
        function(response) {
            console.log("error" + response);
            errorBar.error = response[0];
            rooms.clear();
        });
    }
}
