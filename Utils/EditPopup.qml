import QtQuick
import QtQuick.Controls.Material
import QtQuick.Templates as T
import QtQuick.Controls.Material.impl
import QtQuick.Layouts

Popup {
    id: control

    property string popupText: ""
    property int index: -1

    signal updateListText(string newText, int index)

    width: 300
    height: 150
    closePolicy: Popup.NoAutoClose
    padding: 10
    modal: true

    background: Rectangle {
        radius: 16
        color: "#1e1e1e"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        TextField {
            id: editText

            Layout.fillWidth: true
            color: "#fafafa"
            text: control.popupText

            leftPadding: 16
            rightPadding: 16

            background: Rectangle {
                color: "#363636"
                radius: control.height/2
            }
        }

        Button {
            id: saveButton
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 40
            Layout.preferredWidth: 200

            contentItem: Text {
                text: "Update Task"
                font.pointSize: 12
                color: "#fff"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            background: Rectangle {
                anchors.fill: parent
                color: addItemButton.hovered ? Qt.darker("#2ba84a",1.1) : "#2ba84a"
                radius: 10
            }
            onClicked: {
                updateListText(editText.text, control.index)
                control.close()
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }

    function showPopup(displayText, index) {
        control.popupText = displayText
        control.index = index
        control.open()
    }
}


