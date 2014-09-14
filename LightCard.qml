import QtQuick 2.0

Item {
    id: cardContent

    property int minWidth: 80
    property int minHeight: 80

    width: 80*u
    height: 80*u

    property bool value : true

    Rectangle {
        width: parent.width - 5*u
        height: parent.height - 5*u
        anchors.centerIn: parent
        color: "#5e5751"

        Image {
            id: icon
            source: "img/light_icon"
            width: 40*u
            height: 40*u
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        OnOffButton {
            anchors.right: parent.right
            anchors.left: icon.right
            anchors.verticalCenter: parent.verticalCenter

            checked: value
        }
    }

    Component.onCompleted: {
//        var columnsCount = Math.floor(root.width / (minWidth * u));
//        width = (root.width / columnsCount) * u;
    }
}
