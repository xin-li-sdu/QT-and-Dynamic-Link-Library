#ifndef A_H
#define A_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QGuiApplication>
#include <QClipboard>
#include <QByteArray>
#include <QString>
#include <QFile>
#include<cstdio>
#include<QChar>
#include<string.h>
#include "stdafx.h"

class ENC_SIGN : public QObject
{
    Q_OBJECT
    Q_PROPERTY_AUTO(bool,isLoading)
    Q_PROPERTY_AUTO(QString,responseData);
public:
    explicit ENC_SIGN(QObject *parent = nullptr);

    Q_INVOKABLE void sendMessage(const QString& text,const QString& text_code,const QString& work);
    Q_INVOKABLE bool sendvfyMessage(const QString& text,const QString& text_code);
    Q_INVOKABLE void clipText(const QString& text);
private:
    QJsonObject createMessage(const QString& role,const QString& content);

private:
    QNetworkAccessManager* networkManager;
    QJsonArray messages;
    QString baseKey = "c2stbXgxWm5MQkZ5TzhNYzNmRWl6eDZUM0JsYmtGSnNBWjNiakJjSXB6WGN3QW9KSk11";
};

#endif // A_H

