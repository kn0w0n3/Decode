#ifndef MAINCONTROLLER_H
#define MAINCONTROLLER_H

/*
Author:  Joanthan Baird
Date:    23NOV2022
Purpose: Genetics Analysis Tools
Contact: tr14rc3@gmail.com
 */

#include <QObject>
#include <QThread>
#include <QWidget>
//#include <QApplication>

//File Ops Libs
#include <QFile>
#include <QFileInfo>
#include <QFileDialog>

//Network Libs
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QDebug>


class MainController:  public QWidget{
    Q_OBJECT

public:
    MainController(QWidget *parent = nullptr);

signals:
    void gBankFileData_T(QString gBankData_T);


public slots:
    void loadGenBankData(void);

private:
    QString fileName;
    QString filePath;
    QString gBankFileData = "";


};


#endif // MAINCONTROLLER_H
