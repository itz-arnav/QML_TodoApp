import QtQuick
import QtQuick.Controls.Material
import QtQuick.Templates as T
import QtQuick.Controls.Material.impl
import QtQuick.Layouts

Popup {
    id: control

    property string popupText: ""
    width: 300
    height: 40
    closePolicy: Popup.NoAutoClose
    padding: 5

    background: Rectangle {
        radius: control.height/4
        color: Qt.lighter("#cee4d2",1.1)
        border.width: 2
        border.color: "#cee4d2"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 16

        Rectangle {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: 32
            Layout.fillHeight: true
            color: "#37b359"
            radius: height/3

            Rectangle {
                anchors.centerIn: parent
                width: 24
                height: 24
                radius: width/2
                color: "#fff"

                Image {
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/Images/check.svg"
                }
            }
        }

        Text {
            text: control.popupText
            font {
                pointSize: 12.5
                weight: Font.DemiBold
            }
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            color: "#1e1e1e"
        }

        Item {
            Layout.fillWidth: true
        }
    }

    onAboutToShow: popupTimer.start()

    Timer {
        id: popupTimer
        interval: 1000
        repeat: false
        onTriggered: control.close()
    }

    function showPopup(displayText) {
        control.popupText  = displayText
        control.open()
    }
}


