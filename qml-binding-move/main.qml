import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root

    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    Rectangle {
        id: rectFirst

        property int reactPosition: {
            console.log("rectFirst.reactPosition")
            return enabled ? 0 : 100
        }

        color: "lightblue"
        height: 200
        width: 200
        x: reactPosition
        y: reactPosition
    }

    Rectangle {
        id: rectSecond

        function rectPosition() {
            console.log("rectSecond.reactPosition")
            return enabled ? 0 : 100
        }

        color: "lightblue"
        height: 200
        width: 200
        x: rectPosition()
        y: rectPosition()
    }
}
