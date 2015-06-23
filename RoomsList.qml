import QtQuick 2.0
import "Dimension.js" as Dimension
import "WebService.js" as WebService

Rectangle {

    ListView {
        id: listView
        anchors.fill: parent
        model: rooms
        delegate: listDelegate
        spacing: Dimension.SPACING*u
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
        console.log("Item.onVisibleChanged " + visible);

        if (visible) {
            WebService.getRooms(settings.hostname, function(resp) {
                rooms.clear();
                for(var i = 0; i < resp.length; i++) {
                    rooms.append(resp[i]);
                    console.log(resp[i].name);
                }
            })
        }
    }
}
