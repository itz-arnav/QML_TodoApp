import QtQuick
import QtQuick.Controls.Material
import QtQuick.Templates as T
import QtQuick.Controls.Material.impl
import QtQuick.Layouts

Popup {
    id: control

    property string popupText: ""
    width: 300
    height: 60
    closePolicy: Popup.NoAutoClose
    padding: 5

    background: Rectangle {
        radius: control.height/4
        color: "#eaf7ee"
        border.width: 2
        border.color: "#cee4d2"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 16

        Rectangle {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "#37b359"
            radius: height/3

            Rectangle {
                anchors.centerIn: parent
                width: 36
                height: 36
                radius: width/2
                color: "#fff"

                Image {
                    anchors.centerIn: parent
                    width: 24
                    height: 24
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
            color: "#1a1a1a"
        }

        Item {
            Layout.fillWidth: true
        }
    }

    onAboutToShow: popupTimer.start()

    Timer {
        id: popupTimer
        interval: 3000
        repeat: false
        onTriggered: control.close()
    }
}


