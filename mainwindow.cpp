#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFile>
#include <QString>
#include<cstdio>
#include "a.h"
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QFile styleFile(":/sty.qss"); // 样式表文件的路径
    styleFile.open(QFile::ReadOnly);
    QString styleSheet = QLatin1String(styleFile.readAll());
    qApp->setStyleSheet(styleSheet);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QString input = ui->lineEdit->text();
    bool ok;
    double num = input.toInt(&ok);
    if(ok)
    {
        double result = add(num);
        //QString result2=QString(result);
        ui->lineEdit_2->setText(QString::number(result));
        //ui->lineEdit_2->setText(ZZ::number(result));
    }


    else
    {
        ui->lineEdit_2->setText("Invalid input!");
    }
}
