import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    id: rootWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Button {
        z: 10
        text: "Reload"
        onClicked: {
            RuntimeQml.reload();
        }
    }

    GridLayout {
        anchors.fill: parent
        columns: 2
        rows: 2
        columnSpacing: 1
        rowSpacing: 1

        Frame1{}

        Frame2{}

        Loader {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/noreload/qml/FrameInNoReloadPrefix.qml"
        }

        FrameNoReload{}
    }
}
