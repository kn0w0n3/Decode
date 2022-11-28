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

    /*
    This will probably need to be different for each database or depending on what you are doing
    Basic Searching: This is a search query. User selects database and enters search terms
    esearch.fcgi?db=<database>&term=<query>
    */
    //QUrl url(entrezBaseUrl + "esearch.fcgi?db=" + databaseChoice +  "&term=" + userSearchTerm);


    /*
    Downloading Full Records
    Basic Downloading
    efetch.fcgi?db=<database>&id=<uid_list>&rettype=<retrieval_type>
    &retmode=<retrieval_mode>
    Input: List of UIDs (&id); Entrez database (&db); Retrieval type (&rettype); Retrieval mode (&retmode)
    Output: Formatted data records as specified
    Example: Download nuccore GIs 34577062 and 24475906 in FASTA format
    https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=34577062,24475906&rettype=fasta&retmode=text
    */

    QUrl url(entrezBaseUrl + "esearch.fcgi?db=" + databaseChoice +  "&term=" + userSearchTerm);
    request.setUrl(url);
    networkResponse = manager->get(request);
    connect(networkResponse, &QNetworkReply::finished, this, &NetworkManager::processIncomingData);
    connect(networkResponse, &QIODevice::readyRead, this, &NetworkManager::slotReadyRead);
    connect(networkResponse, SIGNAL(downloadProgress(qint64,qint64)), this, SLOT(updateDownloadProgress(qint64,qint64)));
}
