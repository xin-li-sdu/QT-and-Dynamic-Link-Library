#include "ENC_SIGN.h"
#include "abc.h"
#include<iostream>
using namespace std;
char mmm[10]="";
ENC_SIGN::ENC_SIGN(QObject *parent)
    : QObject{parent}
{
    isLoading(false);
    networkManager = new QNetworkAccessManager(this);
}
extern char msk;//为msk存储做实验
bool ENC_SIGN::sendvfyMessage(const QString& text,const QString& text_code)//回传函数
{
    if(text_code!="1234")
       return false;
    return true;
}
void ENC_SIGN::sendMessage(const QString& text,const QString& text_code,const QString& work)//回传函数
{
    isLoading(true);

    QByteArray byte1 = text_code.toUtf8();
    char* buf;
    buf=byte1.data();
    int len = byte1.size();
    mmm[0]=char(len)+'0';
    if(work=="encsign")
    {
        responseData("说明这个是加密&签名");
        responseData(mmm);
        responseData("原文:"+text_code);//回传指令
        responseData(buf);
    }
    else if(work=="enc")
    {
        responseData("说明这个是加密");
        responseData("原文:"+text_code);//回传指令
        responseData("msk模式修改首位:"+byte1);
    }
    else if(work=="sign")
    {
        responseData("说明这个是签名");
        responseData("原文:"+text_code);//回传指令
        responseData("msk模式修改首位:"+byte1);
    }
    else if(work=="dec")
    {
        responseData("说明这个是解密");
        responseData("密文:"+text_code);//回传指令
    }
    else if(work=="vfy")
    {
        responseData("说明这个是认证");
        responseData("密文:"+text_code);//回传指令
    }
    else if(work=="keygen")
    {
        responseData("返回用户pk");
        responseData("密文:"+pkword());//回传指令
    }
}

QJsonObject ENC_SIGN::createMessage(const QString& role,const QString& content)
{
    QJsonObject message;
    message.insert("role",role);
    message.insert("content",content);
    return message;
}

void ENC_SIGN::clipText(const QString& text)
{
    qDebug()<<text;
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(text);
}

