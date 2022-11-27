#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QtNetwork>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QFile>
#include <QTimer>
#include <QTextStream>
#include <QDataStream>

/*
Author:  Joanthan Baird
Date:    23NOV2022
Purpose: Genetics Analysis Tools
Contact: tr14rc3@gmail.com
 */

class NetworkManager : public QObject{
    Q_OBJECT

public:
    NetworkManager();

public slots:
    void replyFinished();
    void slotReadyRead();
    void updateDownloadProgress(qint64, qint64);
    void processIncomingData();
    void downloadGenBankData();

signals:
    void resultReady(const QString);
    void currentProgress(qint64, qint64);
    void currentProgressFiles(int);
    void dataSize(int xx);
    void state(QString);
    void gBankdataToQml(QString gBankData_N);

private:
    QNetworkAccessManager *manager;
    QNetworkRequest request;
    QNetworkReply *networkResponse;
    QTimer *fileDownloader;
    qint64 incomingDataSize;
    QByteArray responseData;
};
#endif // NETWORKMANAGER_H
