#include "mainwindow.h"

#include <QApplication>
#include <iostream>
using namespace std;
#include <NTL/ZZ.h>
using namespace NTL;
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();

}
