pragma Singleton
//左下角关于栏
import QtQuick
import FluentUI

FluObject{
    id:footer_items
    FluPaneItemSeparator{}
    FluPaneItem{
        title:"意见反馈"
        onTap:{
            Qt.openUrlExternally("https://github.com/zhuzichu520/FluentUI/issues/new")
        }
    }
    FluPaneItem{
        title:"关于PGP"
        onTap:{
            FluApp.navigate("/about")
        }
    }
}
