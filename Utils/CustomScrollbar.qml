import QtQuick
import QtQuick.Controls.Material
import QtQuick.Templates as T


T.ScrollBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    interactive: true
    policy: ScrollBar.AsNeeded
    padding: control.interactive ? 1 : 2
    visible: control.policy !== T.ScrollBar.AlwaysOff
    minimumSize: 0.1

    contentItem: Rectangle {
        implicitWidth: 4

        color: control.pressed ? "#bbb" :
                                   control.interactive || control.hovered ? "#aaa" : "transparent"
        opacity: 0.0
    }

    background: Rectangle {
        color: "transparent"
    }

    states: State {
        name: "active"
        when: control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0)
    }

    transitions: [
        Transition {
            to: "active"
            NumberAnimation {
                targets: [control.contentItem, control.background];
                property: "opacity";
                to: 1.0
                duration: 100
            }
        },
        Transition {
            from: "active"
            SequentialAnimation {
                PropertyAction{ targets: [control.contentItem, control.background]; property: "opacity"; value: 1.0 }
                PauseAnimation { duration: 150 }
                NumberAnimation {
                    targets: [control.contentItem, control.background];
                    property: "opacity";
                    to: 0.0
                    duration: 100
                }
            }
        }
    ]
}
