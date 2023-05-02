import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0

Item {
    id: root

    signal keyEvent(keycode: int, text: string)

    property int hpadding: 0
    property int vpadding: 15

    property int keywidth: (root.width - 2 * padding) / 10 - keyhspacing
    property int keyheight: (root.height - 2 * padding) / 4 - keyvspacing
    property int keyhspacing: 4
    property int keyvspacing: 5

    function emitKeyEvent(key, keycode) {
        keyEvent(keycode, key)
    }

    ColumnLayout {
        id: rootLayout
        x: hpadding
        y: vpadding
        width: parent.width - 2*hpadding
        spacing: keyvspacing
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: keyhspacing
            Repeater {
                model: ['q','w','e','r','t','y','u','i','o','p']
                delegate: SeedKeyboardKey {
                    key: modelData
                    kbd: root
                    implicitWidth: keywidth
                    implicitHeight: keyheight
                }
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: keyhspacing
            Repeater {
                model: ['a','s','d','f','g','h','j','k','l']
                delegate: SeedKeyboardKey {
                    key: modelData
                    kbd: root
                    implicitWidth: keywidth
                    implicitHeight: keyheight
                }
            }
            // spacer
            Item { Layout.preferredHeight: 1; Layout.preferredWidth: keywidth / 2 }
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: keyhspacing
            Repeater {
                model: ['z','x','c','v','b','n','m']
                delegate: SeedKeyboardKey {
                    key: modelData
                    kbd: root
                    implicitWidth: keywidth
                    implicitHeight: keyheight
                }
            }
            // spacer
            Item { Layout.preferredHeight: 1; Layout.preferredWidth: keywidth }
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            SeedKeyboardKey {
                key: ' '
                keycode: Qt.Key_Space
                kbd: root
                implicitWidth: keywidth * 5
                implicitHeight: keyheight
            }
            SeedKeyboardKey {
                key: '<'
                keycode: Qt.Key_Backspace
                kbd: root
                implicitWidth: keywidth
                implicitHeight: keyheight
            }
            // spacer
            Item { Layout.preferredHeight: 1; Layout.preferredWidth: keywidth / 2 }
        }
    }

}
