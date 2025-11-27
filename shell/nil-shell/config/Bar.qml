import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Bluetooth

Scope {
    id: root
    property string time

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            Text {
                anchors.centerIn: parent
                text: root.time
            }

            Row {
                spacing: 10

                Repeater {
                    model: Bluetooth.defaultAdapter.devices
                    delegate: Text {
                        text: modelData.name
                    }
                }
            }
        }
    }

    Process {
        id: dateProc
        command: ["date"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.time = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
