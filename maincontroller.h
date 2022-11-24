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

//File Ops Libs
#include <QFile>
#include <QFileInfo>
#include <QFileDialog>

//Network Libs
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QDebug>
#include "networkmanager.h"

class MainController:  public QWidget{
    Q_OBJECT

public:
    MainController(QWidget *parent = nullptr);

signals:


public slots:


private:
    NetworkManager *genBankNetworkMgr;

};


#endif // MAINCONTROLLER_H
