#include "ChatController.h"

ChatController::ChatController(QObject *parent)
    : QObject{parent}
{
    isLoading(false);
    //networkManager = new QNetworkAccessManager(this);
}

QString ChatController::sendMessage()
{

    return "TEST";
}


