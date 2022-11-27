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

//Process the data and write to file
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

//APIs
//https://www.ncbi.nlm.nih.gov/
//A mirror of the GenBank FTP site at the NCBI is available at the University of Indiana, courtesy of the Bio-Mirror project:
//ftp://bio-mirror.net/biomirror/genbank/
//Set the URL for the file download. Connect signals and slots to get the data and metadata.
void NetworkManager::downloadGenBankData(){
    qDebug() << "Requesting data over network!";

    //"https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch -db pubmed -query "selective serotonin reuptake inhibitor""
    //QUrl url("ftp://ftp.ncbi.nlm.nih.gov/genomes/all/README_change_notice.txt");
    QUrl url("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=protein&id=6678417,9507199,28558982,28558984,28558988,28558990");
    //url.setUserName("anonymous");
    //url.setPassword("anonymous");
    //url.setPort(21);
    request.setUrl(url);
    networkResponse = manager->get(request);
    connect(networkResponse, &QNetworkReply::finished, this, &NetworkManager::processIncomingData);
    connect(networkResponse, &QIODevice::readyRead, this, &NetworkManager::slotReadyRead);
    connect(networkResponse, SIGNAL(downloadProgress(qint64,qint64)), this, SLOT(updateDownloadProgress(qint64,qint64)));
}
