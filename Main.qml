import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

import TodoApp

Window {
    id: root
    width: 400
    height: 600
    visible: true
    title: qsTr("Todo App")
    color: "#1e1e1e"

    ColumnLayout {
        anchors {
            fill: parent
            margins: 10
            topMargin: 30
            bottomMargin: 30
        }

        spacing: 10

        CustomTextField {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 40
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16

            spacing: 5

            Text {
                text: BackendHelper.currentDay
                font {
                    pointSize: 36
                    weight: Font.DemiBold
                }
                color: "#fff"
            }

            ColumnLayout {
                spacing: 0
                Text {
                    text: BackendHelper.currentMonth
                    font {
                        pointSize: 14
                        weight: Font.Medium
                    }
                    color: "#ddd"
                }

                Text {
                    text: BackendHelper.currentYear
                    font {
                        pointSize: 12
                        weight: Font.Medium
                    }
                    color: "#aaa"
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                text: BackendHelper.currentDayOfWeek
                font {
                    pointSize: 14
                    weight: Font.Medium
                }
                color: "#fff"
            }

        }

        Item {
            Layout.fillHeight: true
        }
    }

    AppPopup {
        id: notificationPopup
        x: root.width / 2 - width /2
        y: 30
        popupText: qsTr("Opened the popup")
    }
}
