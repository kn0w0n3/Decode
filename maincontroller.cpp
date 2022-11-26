#include "maincontroller.h"

/*
Author:  Joanthan Baird
Date:    23NOV2022
Purpose: Genetics Analysis Tools
Contact: tr14rc3@gmail.com
 */

MainController::MainController(QWidget *parent) : QWidget(parent){

}

//Select and load data from downloaded GenBank files
void MainController::loadGenBankData(){
    QString file = QFileDialog::getOpenFileName(Q_NULLPTR, tr("Select Directory"), "/home");
    QFileInfo fi(file);
    fileName = fi.fileName();
    QFile fileLocation(file);
    filePath = fi.filePath();

    if (fileLocation.open(QIODevice::ReadOnly)){
        //qDebug() << "In file read funtion";
        QTextStream genBankFileData(&fileLocation);
        while (!genBankFileData.atEnd()){

            gBankFileData = genBankFileData.readAll();
        }
        fileLocation.close();
        emit gBankFileData_T(gBankFileData);
        gBankFileData = "";
    }
}
