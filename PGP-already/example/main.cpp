#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QQuickWindow>
#include <QQuickStyle>
#include <QProcess>
#include "ENC_SIGN.h"
#include <QQmlEngine>
#include <QQmlContext>
#include <NTL/ZZ.h>
#include <QChar>
QMap<QString, QVariant> properties(){
    QMap<QString, QVariant> map;
    //    map["installHelper"] = QVariant::fromValue(QVariant::fromValue(InstallHelper::getInstance()));
    return map;
}
//extern char msk='0';
char msk='0';
int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("xin-li-sdu");
    QCoreApplication::setOrganizationDomain("https://");
    QCoreApplication::setApplicationName("PGP-TEST");
    QQuickStyle::setStyle("Basic");
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<ENC_SIGN>("encsign",1,0,"ENC_SIGN");//加载的c++文件!!!

    QMapIterator<QString, QVariant> iterator(properties());
    while (iterator.hasNext()) {
        iterator.next();
        QString key = iterator.key();
        QVariant value = iterator.value();
        engine.rootContext()->setContextProperty(key,value);
    }
    engine.rootContext()->setContextProperty("properties",properties());
    const QUrl url(QStringLiteral("qrc:/App.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}
