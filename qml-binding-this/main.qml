import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    Item {
        id: item

        width: 500

        Component.onCompleted: {
            item.height = Qt.binding(function () {
                    console.log(this);
                    return this.width * 2;
                });
            console.log("item.height = " + item.height);
            rect.height = Qt.binding(function () {
                    console.log(this);
                    return this.width * 2;
                });
            console.log("rect.height = " + rect.height);
        }

        Rectangle {
            id: rect

            color: "yellow"
            width: 100
        }
    }
}
