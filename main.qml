import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Write Here")

    Canvas{
        id:canvas
        property int lastX: 0
        property int lastY: 0
      property color color: colorTools.paintColor

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
            ctx.strokeStyle = "red"
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
            anchors.bottom: parent.bottom
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
    Row{
        id: colorTools
        spacing: 2
        anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: 8
        }
        property variant activeSquare: Rectangle
        property color paintColor: colorTools.paintColor
        Repeater{
            model:  ["#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]
 Rectangle{
     id: red
      width: 50
      height: 50
      color: modelData
        MouseArea {
            anchors.fill: parent
            onClicked: {
        parent.paintColor = color
        }
        }
  }
    }

}

}

