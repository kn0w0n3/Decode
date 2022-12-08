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
void NetworkManager::searchGenBankData(int searchType, QString uST){
    qDebug() << "Requesting data over network!";
    qDebug() << "The search type is: " << searchType;
    p_SearchType = searchType;
    //TODO open the documentation pdf
    //TODO Parse XML
    //p_SearchType = 3;
    //qDebug() << "Now the search type is: " << QString::number(p_SearchType);
    //12-5-22: There are 9 E-utilities
    //We are currently interested in ESearch, EFetch, and EInfo

    //ESearch  
    //Base URL: https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi
    //Provides a list of UIDs matching a text query

    //EFetch
    //Base URL: https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi

    //ESearch for data
    if(p_SearchType == 1){
        userSearchTerm = uST;
        qDebug() << "User search term is: " << uST;
        QUrl selectedSearch(eSearchBaseUrl + "?db=" + selectedDatabase + "&term=" + userSearchTerm);
        request.setUrl(selectedSearch);
        networkResponse = manager->get(request);
        connect(networkResponse, &QNetworkReply::finished, this, &NetworkManager::processIncomingData);
        connect(networkResponse, &QIODevice::readyRead, this, &NetworkManager::slotReadyRead);
        connect(networkResponse, SIGNAL(downloadProgress(qint64,qint64)), this, SLOT(updateDownloadProgress(qint64,qint64)));
    }
    //EFetch to get more details about data obtained from the ESearch query
    else if(p_SearchType == 2){
        qDebug() << "In Efetch";
        //efetch.fcgi?db=pubmed&id=19393038,30242208,29453458
        //efetch.fcgi?db=protein&id=15718680,NP_001098858.1,119703751
        //efetch.fcgi?db=protein&query_key=<key>&WebEnv=<webenv string>
        eFetchIDsToSearch = uST;
        //QUrl selectedSearch(eFetchBaseUrl + "?db=" + selectedDatabase + "&id=" + eFetchIDsToSearch + "&retmode=default");

        //A test query
        QUrl selectedSearch(eFetchBaseUrl + "?db=gene&id=7157,7124,7422,3569,7040,4524,3091,2099,3586,351,1636,6774,3845,627,4318,1401,7421,5243,4790,3123&rettype=docsum&retmode=default");
        request.setUrl(selectedSearch);
        networkResponse = manager->get(request);
        connect(networkResponse, &QNetworkReply::finished, this, &NetworkManager::processIncomingData);
        connect(networkResponse, &QIODevice::readyRead, this, &NetworkManager::slotReadyRead);
        connect(networkResponse, SIGNAL(downloadProgress(qint64,qint64)), this, SLOT(updateDownloadProgress(qint64,qint64)));
    }
    //EInfo: Return a list of valid databases
    else if(p_SearchType == 3){
        QUrl selectedSearch("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/einfo.fcgi");
        request.setUrl(selectedSearch);
        networkResponse = manager->get(request);
        connect(networkResponse, &QNetworkReply::finished, this, &NetworkManager::processIncomingData);
        connect(networkResponse, &QIODevice::readyRead, this, &NetworkManager::slotReadyRead);
        connect(networkResponse, SIGNAL(downloadProgress(qint64,qint64)), this, SLOT(updateDownloadProgress(qint64,qint64)));
    }
}
