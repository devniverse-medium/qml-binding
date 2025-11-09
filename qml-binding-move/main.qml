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

    ColumnLayout {
        anchors.fill: parent

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            text: qsTr("Change enabled")

            function _handleClicked() {
                rectFirst.enabled = !rectFirst.enabled
                rectSecond.enabled = !rectSecond.enabled
            }

            onClicked: () => _handleClicked()
            z: 999
        }

        Rectangle {
            id: rectFirst

            property int reactPosition: {
                console.log("rectFirst.reactPosition")
                return enabled ? 0 : 100
            }

            color: "lightblue"
            Layout.fillHeight: true
            Layout.fillWidth: true
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
            Layout.fillHeight: true
            Layout.fillWidth: true
            x: rectPosition()
            y: rectPosition()
        }
    }
}
