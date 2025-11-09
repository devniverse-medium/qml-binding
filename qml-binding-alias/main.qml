import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    Column {
        anchors.fill: parent

        MyCustomButton {
            id: myCustomButton

            button.text: qsTr("Hello World!")
            height: 200
            width: 200

            button.onClicked: function () {
                // Change value of button by internal alias
                myCustomButton.button.text = Math.random(100)
            }
        }

        Rectangle {
            height: 200
            width: 200

            Text {
                text: myCustomButton.button.text
            }
        }
    }
}
