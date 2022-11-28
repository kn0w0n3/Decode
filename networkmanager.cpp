#include "networkmanager.h"
/*
Author:  Joanthan Baird
Date:    23NOV2022
Purpose: Genetics Analysis Tools
Contact: tr14rc3@gmail.com
*/

NetworkManager::NetworkManager(){
    qDebug() << "Update controller initializing";
    //Create the network access manager for dowloading updates/signature files.
    manager = new QNetworkAccessManager(this);
    incomingDataSize = 0;
}

void NetworkManager::replyFinished(){
    qDebug() << "In replyFinished().............";
}

//Get the data size
void NetworkManager::slotReadyRead(){
    qDebug() << "In slotReadyRead().............";
    incomingDataSize = networkResponse->size();
}

//Get the size of the file and update the progress bar via signals and slots.
void NetworkManager::updateDownloadProgress(qint64 bytesRead, qint64 bytesTotal){
    qDebug()<< "In updateDownloadProgress()..........";
    qint64 bR = bytesRead;
    qint64 bT = bytesTotal;
    qDebug() << "read bytes qint64 to string " + QString::number(bR);
    qDebug() << "bytes total qint64 to string " + QString::number(bT);
}

//Process the data and write to file - This may be optional
void NetworkManager::processIncomingData(){
    qDebug() << "The data size... " + QString::number(incomingDataSize);
    QFile file("/home/voldem0rt/Documents/Qt_Projects/Decode/GenBank-Data/data-23NOV2022.txt");
    if (file.open(QIODevice::WriteOnly)){
        QTextStream writToFile(&file);
        responseData = networkResponse->readAll();
        QString responseDataString = QString(responseData);
        writToFile << responseDataString;
        qDebug() << "The network response is: "<< responseDataString;
        emit gBankdataToQml(responseDataString);
    }else{
        qDebug() << "File Error";
        return;
    }
}

//Set the URL for the file download. Connect signals and slots to get the data and metadata.
void NetworkManager::searchGenBankData(int dbC, QString uST){
    qDebug() << "Requesting data over network!";

    databaseChoice = dbNames[dbC];
    qDebug() << "database choice is: " << databaseChoice;

    userSearchTerm = uST;
    qDebug() << "User search term is: " << uST;

    QUrl url(entrezBaseUrl + "esearch.fcgi?db=" + databaseChoice +  "&term=" + userSearchTerm);
    request.setUrl(url);
    networkResponse = manager->get(request);
    connect(networkResponse, &QNetworkReply::finished, this, &NetworkManager::processIncomingData);
    connect(networkResponse, &QIODevice::readyRead, this, &NetworkManager::slotReadyRead);
    connect(networkResponse, SIGNAL(downloadProgress(qint64,qint64)), this, SLOT(updateDownloadProgress(qint64,qint64)));
}
