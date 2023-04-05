﻿pragma Singleton

import QtQuick
import FluentUI


FluObject{

    property var navigationView

    FluPaneItem{
        title:"项目介绍"
        icon:FluentIcons.Home
        onTap:{
            navigationView.push("qrc:/T_Home.qml")
        }
    }

    FluPaneItem
    {
        title:"邮件加密&签名"
        icon:FluentIcons.CheckboxComposite
        onTap:{
            navigationView.push("qrc:/T_TextBox.qml")
        }

    }

    FluPaneItem
    {
        title:"邮件解密&认证"
        icon:FluentIcons.GridView   
        onTap:{

            navigationView.push("qrc:/T_Home1.qml")
            }


    }


    FluPaneItemExpander
   {
        title:"用户注册"
        icon:FluentIcons.SurfaceHub

        FluPaneItem{
            title:"InfoBar"
            image:"qrc:/res/image/control/InfoBar.png"
            recentlyUpdated:true
            desc:"An inline message to display app-wide statuschange information."
            onTap:{
                navigationView.push("qrc:/T_InfoBar.qml")
            }
        }

        FluPaneItem{
            title:"Progress"
            onTap:{
                navigationView.push("qrc:/T_Progress.qml")
            }
        }

        FluPaneItem{
            title:"Badge"
            onTap:{
                navigationView.push("qrc:/T_Badge.qml")
            }
        }

        FluPaneItem{
            title:"Rectangle"
            onTap:{
                navigationView.push("qrc:/T_Rectangle.qml")
            }
        }

        FluPaneItem{
            title:"Carousel"
            onTap:{
                navigationView.push("qrc:/T_Carousel.qml")
            }
        }

        FluPaneItem{
            title:"Expander"
            onTap:{
                navigationView.push("qrc:/T_Expander.qml")
            }
        }

    }

   /* FluPaneItemExpander
{
        title:"Popus"
        icon:FluentIcons.ButtonMenu
        FluPaneItem{
            title:"Dialog"
            onTap:{
                navigationView.push("qrc:/T_Dialog.qml")
            }
        }

        FluPaneItem{
            title:"Tooltip"
            onTap:{
                navigationView.push("qrc:/T_Tooltip.qml")
            }
        }

        FluPaneItem{
            title:"Menu"
            onTap:{
                navigationView.push("qrc:/T_Menu.qml")
            }
        }
    }

    FluPaneItemExpander{
        title:"Navigation"
        icon:FluentIcons.AllApps

        FluPaneItem{
            title:"Pivot"
            image:"qrc:/res/image/control/Pivot.png"
            recentlyAdded:true
            order:3
            desc:"Presents information from different sources in atabbed view."
            onTap:{
                navigationView.push("qrc:/T_Pivot.qml")
            }
        }
        FluPaneItem{
            title:"TabView"
            image:"qrc:/res/image/control/TabView.png"
            recentlyAdded:true
            order:1
            desc:"A control that displays a collection of tabs thatcan be used to display several documents."
            onTap:{
                navigationView.push("qrc:/T_TabView.qml")
            }
        }
        FluPaneItem{
            title:"TreeView"
            onTap:{
                navigationView.push("qrc:/T_TreeView.qml")
            }
        }
        FluPaneItem{
            title:"MultiWindow"
            onTap:{
                navigationView.push("qrc:/T_MultiWindow.qml")
            }
        }
        FluPaneItem{
            title:"FlipView"
            image:"qrc:/res/image/control/FlipView.png"
            recentlyAdded:true
            order:2
            desc:"Presents a collection of items that the user canflip through, one item at a time."
            onTap:{
                navigationView.push("qrc:/T_FlipView.qml")
            }
        }
    }
*/
   /* FluPaneItemExpander
{
        title:"Theming"
        icon:FluentIcons.Brightness
        FluPaneItem
        {
            title:"Theme"
            onTap:{
                navigationView.push("qrc:/T_Theme.qml")
            }
        }

        FluPaneItem{
            title:"Awesome"
            onTap:{
                navigationView.push("qrc:/T_Awesome.qml")
            }
        }
        FluPaneItem{
            title:"Typography"
            onTap:{
                navigationView.push("qrc:/T_Typography.qml")
            }
        }
    }
*/
   /* FluPaneItemExpander{
        title:"Media"
        icon:FluentIcons.Media
        FluPaneItem{
            title:"MediaPlayer"
            image:"qrc:/res/image/control/MediaPlayerElement.png"
            recentlyAdded:true
            order:0
            desc:"A control to display video and image content."
            onTap:{
                navigationView.push("qrc:/T_MediaPlayer.qml")
            }
        }
    }
*/
    function getRecentlyAddedData(){
        var arr = []
        for(var i=0;i<children.length;i++){
            var item = children[i]
            if(item instanceof FluPaneItem && item.recentlyAdded){
                arr.push(item)
            }
            if(item instanceof FluPaneItemExpander){
                for(var j=0;j<item.children.length;j++){
                    var itemChild = item.children[j]
                    if(itemChild instanceof FluPaneItem && itemChild.recentlyAdded){
                        arr.push(itemChild)
                    }
                }
            }
        }
        arr.sort(function(o1,o2){ return o2.order-o1.order })
        return arr
    }

    function getRecentlyUpdatedData(){
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem && item.recentlyUpdated){
                arr.push(item)
            }
        }
        return arr
    }

    function getSearchData(){
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem){
                arr.push({title:item.title,key:item.key})
            }
        }
        return arr
    }

    function startPageByItem(data){
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item =  items[i]
            if(item.key === data.key){
                if(navigationView.getCurrentIndex() === i){
                    return
                }
                item.tap()
                navigationView.setCurrentIndex(i)
                if(item.parent){
                    item.parent.isExpand = true
                }
                return
            }
        }
    }

}

