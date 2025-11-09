import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0

import UserControl 1.0

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            color: "#989898"
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                width: parent.width

                anchors.centerIn: parent
                TextField {
                    id: tfUserName
                    Layout.alignment: Qt.AlignHCenter
                    placeholderText: qsTr("User name")
                }
                TextField {
                    id: tfPhoneNumber
                    Layout.alignment: Qt.AlignHCenter
                    placeholderText: qsTr("Phone number")
                }
                Button {
                    id: btnUpdateInfo
                    text: qsTr("Update")
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: () => root._handleUpdate()
                }
            }
        }

        Rectangle {
            color: "#707070"
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                width: parent.width
                anchors.centerIn: parent

                Label {
                    id: lblUserName
                    text: root._handleUserName()
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    id: lblPhoneNumber
                    text: root._handlePhoneNumber()
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }

    function _handleUserName() {
        return qsTr("Name: ") + (userControl.dsName !== "" ? userControl.dsName : "none")
    }

    function _handlePhoneNumber() {
        return qsTr("Phone Number: ") + (userControl.dsPhoneNumber
                                         !== "" ? userControl.dsPhoneNumber : "none")
    }

    function _handleUpdate() {
        userControl.updateInfomations(tfUserName.text, tfPhoneNumber.text)
    }

    UserControl {
        id: userControl
    }
}
