import QtQuick 2.6

Item {
    id: root

    property string name

    property bool rotate: root.name.match(/.*-rotate/) !== null
    property bool shadow: false

    width: 28
    height: 28

    Image {
        id: image
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        source: name
        fillMode: Image.PreserveAspectFit

        NumberAnimation on rotation {
            running: root.rotate
            from: 0
            to: 360
            loops: Animation.Infinite
            duration: 1100
        }
    }
}
