import QtQuick 2.6

import "image.js" as Image


Item {
    id: root

    property string name
    property bool rotate: root.name.match(/.*-rotate/) !== null

    property bool shadow: false

    property var icons: Image.map
    width: 28
    height: 28

    Image {
        id: image
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        source: root.icons[name]

        fillMode: Image.PreserveAspectFit

        NumberAnimation on rotation {
            running: root.rotate
            from: 0
            to: 360
            loops: Animation.Infinite
            duration: 1100
        }
    }
    Text {
        id: actiontext

        width: availableWidth

        text: model.label || model.name
        color: "#eee"
        font.pixelSize: 11
        anchors.top: image.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        topPadding: 5
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlighVCenter

    }
}
