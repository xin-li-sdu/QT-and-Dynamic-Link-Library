import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluWindow {

    width: 500
    height: 600
    minimumWidth: 500
    minimumHeight: 600
    maximumWidth: 500
    maximumHeight: 600

    title:"关于"

    FluAppBar{
        id:appbar
        title:"关于"
        width:parent.width
    }

    ColumnLayout{
        anchors{
            top: appbar.bottom
            left: parent.left
            right: parent.right
        }

        RowLayout{
            Layout.topMargin: 20
            Layout.leftMargin: 15
            spacing: 14
            FluText{
                text:" New PGP"
                fontStyle: FluText.Title
            }
            FluText{
                text:"v1.0"
                fontStyle: FluText.Body
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout{
            spacing: 14
            Layout.topMargin: 20
            Layout.leftMargin: 15
            FluText{
                text:"项目团队："
            }
            FluText{
                text:"话说还不知道队名是什么"
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout{
            spacing: 14
            Layout.topMargin: 20
            Layout.leftMargin: 15
            FluText{
                text:"GitHub："
            }
            FluTextButton{
                id:text_hublink
                text:"现在还没放上去"
                Layout.alignment: Qt.AlignBottom
                onClicked: {
                    Qt.openUrlExternally(text_hublink.text)
                }
            }
        }
        RowLayout{
            spacing: 14
            Layout.topMargin: 20
            Layout.leftMargin: 15
            FluText{
                id:text_info
                text:"加油干活"
                ColorAnimation {
                    id: animation
                    target: text_info
                    property: "color"
                    from: "red"
                    to: "blue"
                    duration: 1000
                    running: true
                    loops: Animation.Infinite
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
