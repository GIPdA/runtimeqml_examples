import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    Layout.fillHeight: true
    Layout.fillWidth: true

    Rectangle {
        anchors.fill: parent
        color: "teal"
        opacity: 0.5
    }

    Label {
        anchors.centerIn: parent
        text: "FrameNoReload"
    }
}
