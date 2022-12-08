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
#include <QDesktopServices>
#include <QProcess>

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
    void searchGenBankData(int, QString);

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

    //Variables for the Entrez API database queries
    QString entrezBaseUrl = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/";
    QString eSearchBaseUrl = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi";
    QString eFetchBaseUrl = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi";
    QString selectedDatabase = "Gene";
    QString userSearchTerm = "";
    QString eFetchIDsToSearch = "";
    int p_SearchType = 0;
    QString dbNames[35] = {"Select Database","Gene","GEO DataSets","GEO Profiles","HomoloGene","PopSet","Assembly","BioCollections",
                           "BioProject","BioSample","Genome", "Nucleotide","SRA","Taxonomy","Conseved Domains","Identical Protein Groups",
                           "Protein","Protein Family Models","Structure","ClinicalTrials.gov","ClinVar", "dbGaP","dbSNP","dbVaR","GTR","MedGen",
                           "OMIM","blastsn","blastx","tblastn","Primer-Blast","BioAssays","Compounds","Pathways","Substances"};
};
#endif // NETWORKMANAGER_H
