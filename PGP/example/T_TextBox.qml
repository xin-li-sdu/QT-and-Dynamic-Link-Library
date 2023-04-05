import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI

FluScrollablePage{

    title:"加密&签名"
    leftPadding:10
    rightPadding:10
    bottomPadding:20

    FluTextBox{
        id:textbox_email
        Layout.topMargin: 20
        placeholderText: "接收者邮箱"
        Layout.preferredWidth: 300
        disabled:toggle_switch.selected
    }
    FluMultilineTextBox
    {
        id:textbox_code
        Layout.topMargin: 20
        Layout.preferredWidth: 300
        Layout.preferredHeight: 100
        placeholderText: "明文"
        disabled:toggle_switch.selected
        //var orgPasswd = FluMultilineTextBox.text;
    }

    FluFilledButton
    {
                text:"加密&签名"
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 20
                onClicked:
                {
                    if(textbox_email.text === "")
                    {
                        showError("邮箱不能为空")
                        return
                    }
                    else if(textbox_code.text === "")
                    {
                        showError("明文不能为空")
                        return
                    }
                    else
                    {

                    }

                    //onResult({password:textbox_password.text})
                   // window.close()
                }
    }
    function generateRandomNames(numNames) {
        const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const names = [];
        function generateRandomName() {
            const nameLength = Math.floor(Math.random() * 5) + 4;
            let name = '';
            for (let i = 0; i < nameLength; i++) {
                const letterIndex = Math.floor(Math.random() * 26);
                name += alphabet.charAt(letterIndex);
            }
            return name;
        }
        for (let i = 0; i < numNames; i++)
        {
            const name = generateRandomName();
            names.push({title:name});
        }
        return names;
    }

}
