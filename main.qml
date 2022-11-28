import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12

/*
Author:  Joanthan Baird
Date:    23NOV2022
Purpose: Genetics Analysis Tools
Contact: tr14rc3@gmail.com
 */

Window {
    width: 1920
    height: 1080
    visible: true
    color: "#ffffff"
    title: qsTr("Decode")

    //Connections for passing data between C++ classes and QML GUI components
    //Main controller connections
    Connections {
        target: mainController
        onGBankFileData_T: {
            textAreaGenBankData.text += gBankData_T
            //textAreaTemp.text += gBankData_T
        }
    }
    //Network manager connections
    Connections {
        target: networkManager
        onGBankdataToQml: {
            textAreaTemp.text += gBankData_N
        }
    }


    Rectangle {
        id: dataViewerWin
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"

        Video {
            id: videoY
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            clip: false
            anchors.fill: parent
            loops: MediaPlayer.Infinite
            focus: true
        }

        Rectangle {
            id: borderRectGenBData
            x: 227
            y: 105
            width: 826
            height: 440
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollViewGenBankData
                x: 8
                y: 8
                width: 810
                height: 424
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AsNeeded
                TextArea {
                    id: textAreaGenBankData
                    x: 0
                    y: 0
                    width: 810
                    height: 424
                    color: "#ffffff"
                    font.pointSize: 11
                    placeholderText: qsTr("")
                }
            }
        }

        Button {
            id: dvw_LoadDataBtn
            x: 234
            y: 569
            width: 100
            height: 40
            visible: true
            text: qsTr("Select File")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"
            onClicked: {
                mainController.loadGenBankData()
            }
        }

        Button {
            id: button4
            x: 590
            y: 569
            width: 100
            height: 40
            text: qsTr("Load")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"
        }

        Button {
            id: button5
            x: 952
            y: 569
            width: 100
            height: 40
            text: qsTr("Help")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"
        }

        Button {
            id: dvw_BackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"

            onClicked: {
                dataViewerWin.visible = false
                genes_Gene_Win.visible = true
                videoX.play()
                videoY.stop()
            }
        }

        Image {
            id: image1
            x: 523
            y: 8
            width: 234
            height: 66
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: genes_Gene_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"

        Video {
            id: videoX
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            clip: false
            anchors.fill: parent
            loops: MediaPlayer.Infinite
            focus: true
            autoPlay: true
        }
        Button {
            id: geneWin_BackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"

            onClicked: {
                mainWinDataSelect.visible = true
                genes_Gene_Win.visible = false

                //videoX.play()
                //videoY.stop()
            }
        }

        Rectangle {
            id: borderRect
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"

            ScrollView {
                id: scrollView
                x: 8
                y: 8
                width: 1205
                height: 628
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AsNeeded
                TextArea {
                    id: textAreaTemp
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    font.pointSize: 11
                    placeholderText: qsTr("")
                }
            }
        }

        Button {
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"

            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX.stop()
                //videoY.play()
                var databaseChoice = control2.currentIndex
                var userSearchterm = userSearchText.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
        }

        Button {
            id: button1
            x: 573
            y: 663
            width: 100
            height: 40
            visible: false
            text: qsTr("About")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"
        }

        Button {
            id: button2
            x: 940
            y: 663
            width: 100
            height: 40
            visible: false
            text: qsTr("Help")
            layer.enabled: true
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                spread: 0
                verticalOffset: 2
                transparentBorder: true
                samples: 17
            }
            palette.buttonText: "#ffffff"
        }

        Image {
            id: image
            x: 843
            y: 8
            width: 234
            height: 66
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        ComboBox {
            id: control2
            x: 337
            y: 101
            width: 280
            height: 29
            visible: false

            model: ["Select Database", "GENES - Gene", "GENES - GEO DataSets", "GENES - GEO Profiles", "GENES - HomoloGene", "GENES - PopSet", "GENOMES - Assembly", "GENOMES - BioCollections",
                "GENOMES - BioProject", "GENOMES - BioSample", "GENOMES - Genome", "GENOMES - Nucleotide", "GENOMES - SRA", "GENOMES - Taxonomy", "PROTEINS - Conseved Domains", "PROTEINS - Identical Protein Groups",
                "PROTEINS - Protein", "PROTEINS - Protein Family Models", "PROTEINS - Structure", "CLINICAL - ClinicalTrials.gov", "CLINICAL - ClinVar", "CLINICAL - dbGaP","CLINICAL - dbSNP","CLINICAL - dbVaR", "CLINICAL - GTR", "CLINICAL - MedGen",
                "CLINICAL - OMIM", "BLAST- blastsn", "BLAST- blastsp", "BLAST - blastx", "BLAST - tblastn", "BLAST - Primer-Blast", "PUBCHEM - BioAssays", "PUBCHEM - Compunds", "PUBCHEM - Pathways", "PUBCHEM - Substances"]

            delegate: ItemDelegate {
                width: control2.width
                contentItem: Text {
                    text: control2.textRole
                          ? (Array.isArray(control2.model) ? modelData[control2.textRole] : model[control2.textRole])
                          : modelData
                    color: "#ffffff" //Change the text colr of the model data in the drop down box.
                    font: control2.font
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: control2.highlightedIndex === index
            }

            indicator: Canvas {
                id: canvas2
                x: control2.width - width - control2.rightPadding
                y: control2.topPadding + (control2.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: control2
                    function onPressedChanged() { canvas2.requestPaint(); }
                }

                //This will change the color of the triangle indicator.
                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = control2.pressed ? "#ffffff" : "#ffffff";
                    context.fill();
                }
            }
            //The second color is the main color. The first item is what color the changes to once clicked.
            //This will change the text color of main text in the box.
            contentItem: Text {
                leftPadding: 0
                rightPadding: control2.indicator.width + control2.spacing

                text: control2.displayText
                font: control2.font
                color: control2.pressed ? "#ffffff" : "#ffffff"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            //This will change the main box background color, border color,  and the border color when pressed.
            //The second color is the main color. The first item is what color the changes to once clicked.
            background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                color: "#000000"
                border.color: control2.pressed ? "#ffffff" : "#ffffff"
                border.width: control2.visualFocus ? 2 : 1
                radius: 2
            }

            popup: Popup {
                y: control2.height - 1
                width: control2.width
                implicitHeight: contentItem.implicitHeight
                padding: 1

                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: control2.popup.visible ? control2.delegateModel : null
                    currentIndex: control2.highlightedIndex

                    ScrollIndicator.vertical: ScrollIndicator { }
                }

                //This will change the color of the drop down Rectangle
                background: Rectangle {
                    border.color: "#ffffff"
                    color: "#000000"
                    radius: 5
                }
            }
        }

        Rectangle {
            id: rectangle
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"

            TextEdit {
                id: userSearchText
                x: 4
                y: 6
                width: 1107
                height: 17
                color: "#ffffff"
                font.pixelSize: 15
                clip: true
            }
        }

        Text {
            id: text1
            x: 337
            y: 108
            width: 628
            height: 29
            color: "#ffffff"
            text: qsTr("Gene Database - Collected information about gene loci")
            font.pixelSize: 25
            font.bold: false
        }
    }

    Rectangle {
        id: mainWinDataSelect
        x: 0
        y: 0
        width: 1920
        height: 1080
        visible: true
        color: "#000000"

        Image {
            id: image2
            x: 822
            y: 13
            width: 277
            height: 67
            visible: true
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: genesRect
            x: 131
            y: 97
            width: 400
            height: 389
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: genesCatLabel
                x: 8
                y: 7
                width: 65
                height: 31
                color: "#ffffff"
                text: qsTr("Genes")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: genesDesriptTxt
                x: 8
                y: 42
                width: 336
                height: 69
                color: "#ffffff"
                text: qsTr("Gene sequences and annotations used as references for the study of orthologs structure, expression, and evolution")
                font.pixelSize: 17
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: geneTxtBtn
                x: 8
                y: 117
                width: 48
                height: 22
                color: "#262af7"
                text: qsTr("Gene")
                font.pixelSize: 19

                MouseArea {
                    id: geneTxtBtn_M
                    x: 0
                    y: 0
                    width: 48
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genes_Gene_Win.visible = true
                    }
                }
            }

            Text {
                id: geneBtnText_D
                x: 8
                y: 138
                width: 282
                height: 17
                color: "#ffffff"
                text: qsTr("Collected information about gene loci")
                font.pixelSize: 16
            }

            Text {
                id: geoDataSetsTxtBtn
                x: 8
                y: 161
                width: 125
                height: 22
                color: "#262af7"
                text: qsTr("GEO DataSets")
                font.pixelSize: 19

                MouseArea {
                    id: gdsTxtBtn_M
                    width: 125
                    height: 22
                }
            }

            Text {
                id: geoDataSetsTxtBtn_D
                x: 8
                y: 183
                width: 211
                height: 17
                color: "#ffffff"
                text: qsTr("Functional genomics studies")
                font.pixelSize: 16
            }

            Text {
                id: geoProfilesTxtBtn
                x: 8
                y: 206
                width: 116
                height: 23
                color: "#262af7"
                text: qsTr("GEO Profiles")
                font.pixelSize: 19

                MouseArea {
                    id: gpTxtBtn_M
                    width: 116
                    height: 23
                }
            }

            Text {
                id: geoProfilesTxtBtn_D
                x: 8
                y: 227
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Gene expression and molecular abundance profiles")
                font.pixelSize: 16
            }

            Text {
                id: homoloGeneTxtBtn
                x: 10
                y: 250
                width: 113
                height: 22
                color: "#262af7"
                text: qsTr("HomoloGene")
                font.pixelSize: 19

                MouseArea {
                    id: hGTxtBtn_M
                    width: 113
                    height: 22
                }
            }

            Text {
                id: homoloGeneTxtBtn_D
                x: 10
                y: 271
                width: 345
                height: 17
                color: "#ffffff"
                text: qsTr("Homologous genes sets for selected organisms")
                font.pixelSize: 16
            }

            Text {
                id: popSetTxtBtn
                x: 11
                y: 294
                width: 69
                height: 26
                color: "#262af7"
                text: qsTr("PopSet")
                font.pixelSize: 19

                MouseArea {
                    id: popSetTxtBtn_M
                    width: 69
                    height: 26
                }
            }

            Text {
                id: popSetTxtBtn_D
                x: 10
                y: 317
                width: 359
                height: 41
                color: "#ffffff"
                text: qsTr("Sequence sets from phylogenetic and population studies")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }

        Rectangle {
            id: proteinsRect
            x: 547
            y: 97
            width: 400
            height: 389
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: proteinsCatlabel
                x: 8
                y: 7
                width: 86
                height: 31
                color: "#ffffff"
                text: qsTr("Proteins")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: proteinsDescriptTxt
                x: 8
                y: 42
                width: 336
                height: 69
                color: "#ffffff"
                text: qsTr("Protein sequences, 3-D structures, and tools for the study of functional protein domains and active sites")
                font.pixelSize: 17
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: text16
                x: 8
                y: 117
                width: 174
                height: 22
                color: "#262af7"
                text: qsTr("Conserved Domains")
                font.pixelSize: 19
            }

            Text {
                id: text17
                x: 8
                y: 138
                width: 282
                height: 17
                color: "#ffffff"
                text: qsTr("Conserved protein domains")
                font.pixelSize: 16
            }

            Text {
                id: text18
                x: 8
                y: 161
                width: 217
                height: 22
                color: "#262af7"
                text: qsTr("Identical Protein Groups")
                font.pixelSize: 19
            }

            Text {
                id: text19
                x: 8
                y: 183
                width: 289
                height: 17
                color: "#ffffff"
                text: qsTr("Protein sequences grouped by identity")
                font.pixelSize: 16
            }

            Text {
                id: text20
                x: 8
                y: 206
                width: 72
                height: 23
                color: "#262af7"
                text: qsTr("Protein")
                font.pixelSize: 19
            }

            Text {
                id: text21
                x: 8
                y: 227
                width: 144
                height: 17
                color: "#ffffff"
                text: qsTr("Protein sequences")
                font.pixelSize: 16
            }

            Text {
                id: text22
                x: 10
                y: 250
                width: 196
                height: 22
                color: "#262af7"
                text: qsTr("Protein Family Models")
                font.pixelSize: 19
            }

            Text {
                id: text23
                x: 10
                y: 271
                width: 367
                height: 41
                color: "#ffffff"
                text: qsTr("Models representing homologous proteins with a common function")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text24
                x: 10
                y: 312
                width: 89
                height: 26
                color: "#262af7"
                text: qsTr("Structure")
                font.pixelSize: 19
            }

            Text {
                id: text25
                x: 9
                y: 335
                width: 359
                height: 41
                color: "#ffffff"
                text: qsTr("Experimentally-determined biomolecular structure")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }

        Rectangle {
            id: clinicalRect
            x: 131
            y: 506
            width: 400
            height: 475
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: clinicalCatLabel
                x: 8
                y: 7
                width: 72
                height: 31
                color: "#ffffff"
                text: qsTr("Clinical")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: text51
                x: 8
                y: 39
                width: 336
                height: 69
                color: "#ffffff"
                text: qsTr("Heritable DNA variations, associations with human pathologies, and clinical diagnostics and treatments")
                font.pixelSize: 18
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: text52
                x: 8
                y: 108
                width: 147
                height: 26
                color: "#262af7"
                text: qsTr("ClinicalTrials.gov")
                font.pixelSize: 19
            }

            Text {
                id: text53
                x: 8
                y: 130
                width: 282
                height: 38
                color: "#ffffff"
                text: qsTr("Privately and publicly funded clinical studies conducted around the world")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text54
                x: 8
                y: 168
                width: 72
                height: 22
                color: "#262af7"
                text: qsTr("ClinVar")
                font.pixelSize: 19
            }

            Text {
                id: text55
                x: 8
                y: 188
                width: 211
                height: 17
                color: "#ffffff"
                text: qsTr("Functional genomics studies")
                font.pixelSize: 16
            }

            Text {
                id: text56
                x: 9
                y: 206
                width: 61
                height: 23
                color: "#262af7"
                text: qsTr("dbGaP")
                font.pixelSize: 19
            }

            Text {
                id: text57
                x: 7
                y: 229
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Gene expression and molecular abundance profiles")
                font.pixelSize: 16
            }

            Text {
                id: text58
                x: 8
                y: 248
                width: 68
                height: 22
                color: "#262af7"
                text: qsTr("dbSNP")
                font.pixelSize: 19
            }

            Text {
                id: text59
                x: 7
                y: 268
                width: 345
                height: 17
                color: "#ffffff"
                text: qsTr("Homologous genes sets for selected organisms")
                font.pixelSize: 16
            }

            Text {
                id: text60
                x: 10
                y: 291
                width: 60
                height: 26
                color: "#262af7"
                text: qsTr("dbVar")
                font.pixelSize: 19
            }

            Text {
                id: text61
                x: 7
                y: 312
                width: 359
                height: 21
                color: "#ffffff"
                text: qsTr("Genome structural variation studies")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text89
                x: 10
                y: 332
                width: 46
                height: 23
                color: "#262af7"
                text: qsTr("GTR")
                font.pixelSize: 19
            }

            Text {
                id: text90
                x: 5
                y: 353
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Genetic testing registry")
                font.pixelSize: 16
            }

            Text {
                id: text91
                x: 10
                y: 370
                width: 80
                height: 23
                color: "#262af7"
                text: qsTr("MedGen")
                font.pixelSize: 19
            }

            Text {
                id: text92
                x: 5
                y: 391
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Medical genetics literature and links")
                font.pixelSize: 16
            }

            Text {
                id: text93
                x: 8
                y: 410
                width: 62
                height: 23
                color: "#262af7"
                text: qsTr("OMIM")
                font.pixelSize: 19
            }

            Text {
                id: text94
                x: 5
                y: 429
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Online mendelian inheritance in man")
                font.pixelSize: 16
            }
        }

        Rectangle {
            id: litDatabasesRect
            x: 962
            y: 506
            width: 400
            height: 475
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: literatureCatLabel
                x: 8
                y: 7
                width: 201
                height: 31
                color: "#ffffff"
                text: qsTr("Literature databases")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: text75
                x: 8
                y: 39
                width: 336
                height: 49
                color: "#ffffff"
                text: qsTr("Literature databases for books, reports, journals, articles, medical abstracts, etc.")
                font.pixelSize: 18
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: text76
                x: 8
                y: 94
                width: 92
                height: 22
                color: "#262af7"
                text: qsTr("Bookshelf")
                font.pixelSize: 19
            }

            Text {
                id: text77
                x: 8
                y: 115
                width: 282
                height: 17
                color: "#ffffff"
                text: qsTr("Books and reports")
                font.pixelSize: 16
            }

            Text {
                id: text78
                x: 8
                y: 138
                width: 56
                height: 22
                color: "#262af7"
                text: qsTr("MeSH")
                font.pixelSize: 19
            }

            Text {
                id: text79
                x: 8
                y: 160
                width: 211
                height: 17
                color: "#ffffff"
                text: qsTr("Ontology used for PubMed indexing")
                font.pixelSize: 16
            }

            Text {
                id: text80
                x: 8
                y: 183
                width: 116
                height: 23
                color: "#262af7"
                text: qsTr("NLM Catalog")
                font.pixelSize: 19
            }

            Text {
                id: text81
                x: 8
                y: 204
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Books, journals and more in the NLM Collections")
                font.pixelSize: 16
            }

            Text {
                id: text82
                x: 10
                y: 227
                width: 75
                height: 22
                color: "#262af7"
                text: qsTr("PubMed")
                font.pixelSize: 19
            }

            Text {
                id: text83
                x: 10
                y: 248
                width: 345
                height: 17
                color: "#ffffff"
                text: qsTr("Scientific and medical abstracts/citations")
                font.pixelSize: 16
            }

            Text {
                id: text84
                x: 10
                y: 271
                width: 143
                height: 26
                color: "#262af7"
                text: qsTr("PubMed Central")
                font.pixelSize: 19
            }

            Text {
                id: text85
                x: 10
                y: 294
                width: 359
                height: 22
                color: "#ffffff"
                text: qsTr("Full-text journal articles")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }

        Rectangle {
            id: genomesRect
            x: 547
            y: 506
            width: 400
            height: 475
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: genomesCatabel
                x: 8
                y: 7
                width: 94
                height: 31
                color: "#ffffff"
                text: qsTr("Genomes")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: text39
                x: 8
                y: 39
                width: 353
                height: 62
                color: "#ffffff"
                text: qsTr("Genome sequence assemblies, large-scale functional genomics data, and source biological samples")
                font.pixelSize: 17
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: text40
                x: 9
                y: 100
                width: 94
                height: 22
                color: "#262af7"
                text: qsTr("Assembly")
                font.pixelSize: 19
            }

            Text {
                id: text41
                x: 8
                y: 122
                width: 282
                height: 17
                color: "#ffffff"
                text: qsTr("Genome assembly information")
                font.pixelSize: 16
            }

            Text {
                id: text42
                x: 10
                y: 145
                width: 125
                height: 22
                color: "#262af7"
                text: qsTr("BioCollections")
                font.pixelSize: 19
            }

            Text {
                id: text43
                x: 10
                y: 167
                width: 384
                height: 35
                color: "#ffffff"
                text: qsTr("Museum, herbaria, and other biorepository collections")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text44
                x: 8
                y: 208
                width: 116
                height: 23
                color: "#262af7"
                text: qsTr("BioProject")
                font.pixelSize: 19
            }

            Text {
                id: text45
                x: 8
                y: 229
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Biological projects providing data to NCBI")
                font.pixelSize: 16
            }

            Text {
                id: text46
                x: 8
                y: 252
                width: 113
                height: 22
                color: "#262af7"
                text: qsTr("BioSample")
                font.pixelSize: 19
            }

            Text {
                id: text47
                x: 8
                y: 273
                width: 345
                height: 17
                color: "#ffffff"
                text: qsTr("Descriptions of biological source materials")
                font.pixelSize: 16
            }

            Text {
                id: text48
                x: 10
                y: 296
                width: 69
                height: 26
                color: "#262af7"
                text: qsTr("Genome")
                font.pixelSize: 19
            }

            Text {
                id: text49
                x: 9
                y: 319
                width: 359
                height: 24
                color: "#ffffff"
                text: qsTr("Genome sequencing projects by organism")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text50
                x: 10
                y: 338
                width: 104
                height: 26
                color: "#262af7"
                text: qsTr("Nucleotide")
                font.pixelSize: 19
            }

            Text {
                id: text62
                x: 9
                y: 361
                width: 359
                height: 24
                color: "#ffffff"
                text: qsTr("DNA and RNA sequences")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text74
                x: 10
                y: 384
                width: 42
                height: 26
                color: "#262af7"
                text: qsTr("SRA")
                font.pixelSize: 19
            }

            Text {
                id: text86
                x: 9
                y: 407
                width: 359
                height: 24
                color: "#ffffff"
                text: qsTr("High-throughput sequence reads")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text87
                x: 10
                y: 423
                width: 92
                height: 26
                color: "#262af7"
                text: qsTr("Taxonomy")
                font.pixelSize: 19
            }

            Text {
                id: text88
                x: 9
                y: 446
                width: 359
                height: 24
                color: "#ffffff"
                text: qsTr("Taxonomic classification and nomenclature")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }

        Rectangle {
            id: blastRect
            x: 962
            y: 97
            width: 400
            height: 389
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: blastCatLabel
                x: 8
                y: 7
                width: 65
                height: 31
                color: "#ffffff"
                text: qsTr("BLAST")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: blastDescriptTxt
                x: 8
                y: 42
                width: 336
                height: 46
                color: "#ffffff"
                text: qsTr("A tool to find regions of similarity between biological sequences")
                font.pixelSize: 17
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: text28
                x: 7
                y: 88
                width: 60
                height: 22
                color: "#262af7"
                text: qsTr("blastn")
                font.pixelSize: 19
            }

            Text {
                id: text29
                x: 7
                y: 109
                width: 301
                height: 17
                color: "#ffffff"
                text: qsTr("Search nucleotide sequence databases")
                font.pixelSize: 16
            }

            Text {
                id: text30
                x: 7
                y: 132
                width: 125
                height: 22
                color: "#262af7"
                text: qsTr("blastp")
                font.pixelSize: 19
            }

            Text {
                id: text31
                x: 7
                y: 154
                width: 262
                height: 17
                color: "#ffffff"
                text: qsTr("Search protein sequence databases")
                font.pixelSize: 16
            }

            Text {
                id: text32
                x: 7
                y: 177
                width: 116
                height: 23
                color: "#262af7"
                text: qsTr("blastx")
                font.pixelSize: 19
            }

            Text {
                id: text33
                x: 7
                y: 198
                width: 373
                height: 38
                color: "#ffffff"
                text: qsTr("Search protein databases using a translated nucleotide query")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text34
                x: 7
                y: 242
                width: 113
                height: 22
                color: "#262af7"
                text: qsTr("tblastn")
                font.pixelSize: 19
            }

            Text {
                id: text35
                x: 7
                y: 263
                width: 382
                height: 42
                color: "#ffffff"
                text: qsTr("Search translated nucleotide databases using a protein query")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Text {
                id: text36
                x: 8
                y: 305
                width: 122
                height: 26
                color: "#262af7"
                text: qsTr("Primer-BLAST")
                font.pixelSize: 19
            }

            Text {
                id: text37
                x: 7
                y: 328
                width: 359
                height: 25
                color: "#ffffff"
                text: qsTr("Find primers specific to your PCR template")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }

        Rectangle {
            id: rectangle7
            x: 1375
            y: 97
            width: 400
            height: 389
            color: "#000000"
            border.color: "#ffffff"

            Text {
                id: pubChemCatLabel
                x: 8
                y: 7
                width: 96
                height: 31
                color: "#ffffff"
                text: qsTr("PubChem")
                font.pixelSize: 21
                font.underline: true
                font.bold: false
            }

            Text {
                id: text63
                x: 8
                y: 42
                width: 336
                height: 67
                color: "#ffffff"
                text: "Repository of chemical information, molecular pathways, and tools for bioactivity screening"
                font.pixelSize: 18
                wrapMode: Text.WordWrap
                font.italic: false
                font.bold: false
                clip: false
            }

            Text {
                id: text64
                x: 8
                y: 117
                width: 48
                height: 22
                color: "#262af7"
                text: qsTr("Gene")
                font.pixelSize: 19
            }

            Text {
                id: text65
                x: 8
                y: 138
                width: 282
                height: 17
                color: "#ffffff"
                text: qsTr("Collected information about gene loci")
                font.pixelSize: 16
            }

            Text {
                id: text66
                x: 8
                y: 161
                width: 125
                height: 22
                color: "#262af7"
                text: qsTr("GEO DataSets")
                font.pixelSize: 19
            }

            Text {
                id: text67
                x: 8
                y: 183
                width: 211
                height: 17
                color: "#ffffff"
                text: qsTr("Functional genomics studies")
                font.pixelSize: 16
            }

            Text {
                id: text68
                x: 8
                y: 206
                width: 116
                height: 23
                color: "#262af7"
                text: qsTr("GEO Profiles")
                font.pixelSize: 19
            }

            Text {
                id: text69
                x: 8
                y: 227
                width: 373
                height: 17
                color: "#ffffff"
                text: qsTr("Gene expression and molecular abundance profiles")
                font.pixelSize: 16
            }

            Text {
                id: text70
                x: 10
                y: 250
                width: 113
                height: 22
                color: "#262af7"
                text: qsTr("HomoloGene")
                font.pixelSize: 19
            }

            Text {
                id: text71
                x: 10
                y: 271
                width: 345
                height: 17
                color: "#ffffff"
                text: qsTr("Homologous genes sets for selected organisms")
                font.pixelSize: 16
            }

            Text {
                id: text72
                x: 11
                y: 294
                width: 69
                height: 26
                color: "#262af7"
                text: qsTr("PopSet")
                font.pixelSize: 19
            }

            Text {
                id: text73
                x: 10
                y: 317
                width: 359
                height: 41
                color: "#ffffff"
                text: qsTr("Sequence sets from phylogenetic and population studies")
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }

        Rectangle {
            id: emptyRect
            x: 1375
            y: 506
            width: 400
            height: 475
            color: "#000000"
            border.color: "#ffffff"
        }

        Text {
            id: dataSetsTxtLabel
            x: 131
            y: 43
            width: 168
            height: 37
            color: "#ffffff"
            text: qsTr("Data Sets")
            font.pixelSize: 35
            font.bold: true
            minimumPixelSize: 12
        }
    }
}
