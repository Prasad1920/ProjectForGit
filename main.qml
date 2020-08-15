import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Write Here")

    Canvas{
        property int lastX: 0
        property int lastY: 0

        function clear(){
            var ctx = getContext("2d")
            ctx.reset()
            canvas.requestPaint()
        }




  }
}
