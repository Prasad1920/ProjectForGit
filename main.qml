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
        id:canvas
        property int lastX: 0
        property int lastY: 0
    anchors.fill: parent
        function clear(){
            var ctx = getContext("2d")
            ctx.reset()
            canvas.requestPaint()
        }
        MouseArea{
            id: area
            anchors.fill: parent
            onPressed:
            {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }
            onPositionChanged:
            {

                canvas.requestPaint()
            }
        }
        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth = 1.5
            ctx.strokeStyle = canvas.color
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = area.mouseX
            lastY = area.mouseY
            ctx.lineTo(lastX, lastY)
            ctx.stroke()

        }
        RowLayout{
            id:button
            anchors.horizontalCenter: parent.horizontalCenter
           Button{
               text: 'clear'
               onClicked: canvas.clear();

           }
           Button{
               text: 'Exit'
               onClicked: Qt.quit();

           }
        }


  }
}
