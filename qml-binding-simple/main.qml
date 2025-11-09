import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0

Window {
    id: root

    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    Rectangle {
        id: rect

        color: "red"
        height: parent.height / 1.2
        width: parent.width / 1.2

        onHeightChanged: console.log("Height changed")
        onWidthChanged: console.log("Width changed")

        ColumnLayout {
            anchors.fill: parent

            Button {
                id: btnBreakBinding
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumHeight: 100
                Layout.maximumWidth: 100
                text: qsTr("Break binding")

                onClicked: function () {
                    rect.width = 200
                    rect.height = 200
                }
            }

            Button {
                id: btnQtBinding
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumHeight: 100
                Layout.maximumWidth: 100
                text: qsTr("Qt Binding")

                onClicked: function () {
                    rect.width = Qt.binding(function () {
                        return root.width / 1.2
                    })
                    rect.height = Qt.binding(function () {
                        return root.height / 1.2
                    })
                }
            }

            Button {
                id: btnResizeNoReactivity
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumHeight: 100
                Layout.maximumWidth: 100
                text: qsTr("Resize sem reatividade")

                onClicked: function () {
                    rect.width = root.width / 1.2
                    rect.height = root.height / 1.2
                }
            }
        }
    }
}
