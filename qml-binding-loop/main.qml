import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    // Binding loop example
    Rectangle {
        id: rectBindingLoop

        color: "blue"
        height: rectContentBindingLoop.height + 10
        width: rectContentBindingLoop.width + 10

        Rectangle {
            id: rectContentBindingLoop

            color: "red"
            height: rectBindingLoop.height / 2
            width: rectBindingLoop.width / 2
        }
    }

    // One of the correct ways
    Rectangle {
        id: rectCorrectWay

        color: "blue"
        height: 200
        width: 200

        Rectangle {
            id: rectContent

            anchors.centerIn: parent
            color: "red"
            height: rect.height - 10
            width: rect.width - 10
        }
    }
}
