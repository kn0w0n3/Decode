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
        id: mainWinDataSelect
        x: 0
        y: 0
        width: 1920
        height: 1080
        visible: true
        color: "#000000"

        Image {
            id: decodeLogoMainWin
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
            x: 135
            y: 107
            width: 400
            height: 389
            color: "#000000"
            radius: 10
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
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genes_Geo_Data_Sets_Win.visible = true
                    }
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
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genes_Geo_Profiles_Win.visible = true
                    }
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
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genes_HomoloGene_Win.visible = true
                    }
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
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genes_PopSet_Win.visible = true
                    }
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
            x: 551
            y: 107
            width: 400
            height: 389
            color: "#000000"
            radius: 7
            border.color: "#ffffff"
            rotation: 0.001

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

                MouseArea {
                    id: mouseArea8
                    width: 174
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_ConserveDomain_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea9
                    width: 217
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_Ident_groups_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea10
                    width: 72
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_Protein_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea11
                    width: 196
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_Family_Models_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea12
                    width: 89
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_Structure_Win.visible = true
                    }
                }
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
            x: 135
            y: 516
            width: 400
            height: 475
            color: "#000000"
            radius: 10
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

                MouseArea {
                    id: mouseArea
                    width: 147
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_ClinTrailsGov_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea1
                    width: 72
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_ClinVar_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea2
                    width: 61
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_dbGaP_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea3
                    width: 68
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_dbSNP_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea4
                    width: 60
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_dbVar_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea5
                    width: 46
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_GTR_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea6
                    width: 80
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_MedGen_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea7
                    width: 62
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        clinical_OMIM_Win.visible = true
                    }
                }
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
            x: 966
            y: 516
            width: 400
            height: 475
            color: "#000000"
            radius: 10
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

                MouseArea {
                    id: mouseArea31
                    width: 92
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        literaturedb_Bookshelf_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea32
                    width: 56
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        literaturedb_MeSH_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea33
                    width: 116
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        literaturedb_NLM_Catalog_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea34
                    width: 75
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        literaturedb_PubMed_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea35
                    width: 143
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        literaturedb_PubMed_Central_Win.visible = true
                    }
                }
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
            x: 551
            y: 516
            width: 400
            height: 475
            color: "#000000"
            radius: 10
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

                MouseArea {
                    id: mouseArea13
                    width: 94
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_Assembly_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea14
                    width: 125
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_BioCollections_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea15
                    width: 116
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_BioProject_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea16
                    width: 113
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_BioSample_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea17
                    width: 69
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_Genome_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea18
                    width: 104
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_Nucleotide_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea19
                    width: 42
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_SRA_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea20
                    width: 92
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        genomes_Taxonomy_Win.visible = true
                    }
                }
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
            x: 966
            y: 107
            width: 400
            height: 389
            color: "#000000"
            radius: 10
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

                MouseArea {
                    id: mouseArea21
                    width: 60
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        blast_blastn_Win.visible = true
                    }
                }
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
                width: 60
                height: 22
                color: "#262af7"
                text: qsTr("blastp")
                font.pixelSize: 19

                MouseArea {
                    id: mouseArea22
                    width: 60
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        blast_BlastP_Win.visible = true
                    }
                }
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
                width: 55
                height: 23
                color: "#262af7"
                text: qsTr("blastx")
                font.pixelSize: 19

                MouseArea {
                    id: mouseArea23
                    width: 55
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        blast_blastx_win.visible = true
                    }
                }
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
                width: 66
                height: 22
                color: "#262af7"
                text: qsTr("tblastn")
                font.pixelSize: 19

                MouseArea {
                    id: mouseArea24
                    width: 66
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        blast_tblastn_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea25
                    width: 122
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        blast_Primer_Blast_Win.visible = true
                    }
                }
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
            x: 1379
            y: 107
            width: 400
            height: 389
            color: "#000000"
            radius: 10
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

                MouseArea {
                    id: mouseArea26
                    width: 48
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_ConserveDomain_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea27
                    width: 125
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_ConserveDomain_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea28
                    width: 116
                    height: 23
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_ConserveDomain_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea29
                    width: 113
                    height: 22
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_ConserveDomain_Win.visible = true
                    }
                }
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

                MouseArea {
                    id: mouseArea30
                    width: 69
                    height: 26
                    onClicked: {
                        mainWinDataSelect.visible = false
                        proteins_ConserveDomain_Win.visible = true
                    }
                }
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
            x: 1379
            y: 516
            width: 400
            height: 475
            color: "#000000"
            radius: 10
            border.color: "#ffffff"
        }

        Text {
            id: dataSetsTxtLabel
            x: 135
            y: 64
            width: 168
            height: 37
            color: "#262af7"
            text: qsTr("Data Sets")
            font.pixelSize: 35
            font.bold: false
            minimumPixelSize: 12
        }
    }

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
            autoPlay: false
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
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
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
            x: 489
            y: 111
            width: 628
            height: 29
            color: "#ffffff"
            text: qsTr("Gene Database - Collected information about gene loci")
            font.pixelSize: 25
            font.bold: false
        }

        Text {
            id: text113
            x: 337
            y: 106
            width: 139
            height: 34
            color: "#262af7"
            text: qsTr("Genes Data:")
            font.pixelSize: 25
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }
    Rectangle {
        id: genes_Geo_Data_Sets_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX1
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: geoDataBackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                genes_Geo_Data_Sets_Win.visible = false

                //videoX1.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView1
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp1
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX1.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText1.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText1
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
            id: dbDescTxt
            x: 488
            y: 111
            width: 625
            height: 29
            color: "#ffffff"
            text: qsTr("GEO DataSets Database - Functional genomics studies")
            font.pixelSize: 25
            font.bold: false
        }

        Text {
            id: text114
            x: 337
            y: 106
            width: 139
            height: 34
            color: "#262af7"
            text: qsTr("Genes Data:")
            font.pixelSize: 25
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genes_Geo_Profiles_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX2
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: geoProfileBackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genes_Geo_Profiles_Win.visible = false

                //videoX2.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect1
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView2
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp2
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn1
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX2.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText2.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo1
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect1
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText2
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
            id: dbDescTxt1
            x: 493
            y: 108
            width: 1063
            height: 29
            color: "#ffffff"
            text: qsTr("GEO Profiles Database - Gene expression and molecular abundance profiles")
            font.pixelSize: 25
            font.bold: false
        }

        Text {
            id: text115
            x: 337
            y: 106
            width: 139
            height: 34
            color: "#262af7"
            text: qsTr("Genes Data:")
            font.pixelSize: 25
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genes_HomoloGene_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX3
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: homoloGeneBackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                genes_HomoloGene_Win.visible = false

                //videoX3.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect2
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView3
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp3
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn2
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX3.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText3.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo2
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect2
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText3
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
            id: dbDescTxt2
            x: 488
            y: 111
            width: 836
            height: 29
            color: "#ffffff"
            text: qsTr("HomoloGene Database - Homologous genes sets for selected organisms")
            font.pixelSize: 25
            font.bold: false
        }

        Text {
            id: text116
            x: 337
            y: 106
            width: 139
            height: 34
            color: "#262af7"
            text: qsTr("Genes Data:")
            font.pixelSize: 25
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genes_PopSet_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX4
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: popSetBackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genes_PopSet_Win.visible = false

                //videoX4.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect3
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView4
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp4
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn3
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX4.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText4.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo3
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect3
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText4
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
            id: dbDescTxt3
            x: 488
            y: 111
            width: 864
            height: 29
            visible: true
            color: "#ffffff"
            text: qsTr("PopSet Database - Sequence sets from phylogenetic and population studies")
            font.pixelSize: 25
            font.bold: false
        }

        Text {
            id: text117
            x: 337
            y: 106
            width: 139
            height: 34
            color: "#262af7"
            text: qsTr("Genes Data:")
            font.pixelSize: 25
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: proteins_ConserveDomain_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX5
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                proteins_ConserveDomain_Win.visible = false

                //videoX5.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect4
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView5
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp5
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn4
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX5.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText5.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo4
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect4
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText5
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
            id: dbDescTxt4
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text2
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: proteins_Ident_groups_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX6
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn1
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                proteins_Ident_groups_Win.visible = false

                //videoX6.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect5
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView6
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp6
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn5
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX6.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText6.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo5
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect5
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText6
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
            id: dbDescTxt5
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text3
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: proteins_Protein_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX7
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn2
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                proteins_Protein_Win.visible = false

                //videoX7.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect6
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView7
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp7
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn6
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX7.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText7.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo6
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect6
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText7
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
            id: dbDescTxt6
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text4
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: proteins_Family_Models_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX8
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn3
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                proteins_Family_Models_Win.visible = false

                //videoX8.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect7
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView8
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp8
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn7
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX8.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText8.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo7
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect7
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText8
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
            id: dbDescTxt7
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text5
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: proteins_Structure_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX9
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn4
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                proteins_Structure_Win.visible = false

                //videoX9.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect8
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView9
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp9
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn8
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX9.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText9.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo8
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect8
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText9
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
            id: dbDescTxt8
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text6
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: blast_blastn_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX10
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn5
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                blast_blastn_Win.visible = false

                //videoX10.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect9
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView10
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp10
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn9
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX10.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText10.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo9
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect9
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText10
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
            id: dbDescTxt9
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text7
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: blast_BlastP_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX11
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn6
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                blast_BlastP_Win.visible = false

                //videoX11.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect10
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView11
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp11
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn10
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX11.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText11.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo10
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect10
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText11
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
            id: dbDescTxt10
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text8
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: blast_blastx_win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX12
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn7
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                blast_blastx_win.visible = false

                //videoX12.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect11
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView12
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp12
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn11
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX12.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText12.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo11
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect11
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText12
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
            id: dbDescTxt11
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text9
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: blast_tblastn_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX13
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn8
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                blast_tblastn_Win.visible = false

                //videoX13.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect12
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView13
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp13
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn12
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX13.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText13.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo12
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect12
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText13
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
            id: dbDescTxt12
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text10
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: blast_Primer_Blast_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX14
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn9
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                blast_Primer_Blast_Win.visible = false

                //videoX14.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect13
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView14
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp14
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn13
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX14.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText14.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo13
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect13
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText14
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
            id: dbDescTxt13
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text11
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_Assembly_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX15
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn10
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_Assembly_Win.visible = false

                //videoX15.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect14
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView15
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp15
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn14
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX15.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText15.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo14
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect14
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText15
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
            id: dbDescTxt14
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text12
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_BioCollections_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX16
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn11
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_BioCollections_Win.visible = false

                //videoX16.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect15
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView16
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp16
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn15
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX16.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText16.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo15
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect15
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText16
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
            id: dbDescTxt15
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text13
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_BioProject_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX17
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn12
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_BioProject_Win.visible = false

                //videoX17.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect16
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView17
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp17
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn16
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX17.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText17.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo16
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect16
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText17
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
            id: dbDescTxt16
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text14
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_BioSample_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX18
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn13
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_BioSample_Win.visible = false

                //videoX18.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect17
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView18
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp18
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn17
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX18.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText18.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo17
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect17
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText18
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
            id: dbDescTxt17
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text15
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_Genome_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX19
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn14
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_Genome_Win.visible = false

                //videoX19.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect18
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView19
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp19
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn18
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX19.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText19.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo18
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect18
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText19
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
            id: dbDescTxt18
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text26
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_Nucleotide_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX20
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn15
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_Nucleotide_Win.visible = false

                //videoX20.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect19
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView20
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp20
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn19
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX20.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText20.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo19
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect19
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText20
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
            id: dbDescTxt19
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text27
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_SRA_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX21
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn16
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_SRA_Win.visible = false

                //videoX21.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect20
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView21
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp21
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn20
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX21.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText21.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo20
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect20
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText21
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
            id: dbDescTxt20
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text38
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: genomes_Taxonomy_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX22
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn17
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                genomes_Taxonomy_Win.visible = false

                //videoX22.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect21
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView22
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp22
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn21
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX22.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText22.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo21
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect21
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText22
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
            id: dbDescTxt21
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text95
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_ClinTrailsGov_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX23
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn18
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_ClinTrailsGov_Win.visible = false

                //videoX23.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect22
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView23
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp23
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn22
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX23.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText23.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo22
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect22
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText23
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
            id: dbDescTxt22
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text96
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_ClinVar_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX24
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn19
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_ClinVar_Win.visible = false

                //videoX24.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect23
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView24
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp24
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn23
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX24.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText24.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo23
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect23
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText24
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
            id: dbDescTxt23
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text97
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_dbGaP_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX25
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn20
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_dbGaP_Win.visible = false

                //videoX25.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect24
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView25
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp25
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn24
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX25.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText25.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo24
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect24
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText25
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
            id: dbDescTxt24
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text98
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_dbSNP_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX26
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn21
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_dbSNP_Win.visible = false

                //videoX26.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect25
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView26
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp26
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn25
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX26.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText26.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo25
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect25
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText26
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
            id: dbDescTxt25
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text99
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_dbVar_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX27
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn22
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_dbVar_Win.visible = false

                //videoX27.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect26
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView27
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp27
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn26
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX27.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText27.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo26
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect26
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText27
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
            id: dbDescTxt26
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text100
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_GTR_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX28
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn23
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_GTR_Win.visible = false

                //videoX28.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect27
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView28
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp28
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn27
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX28.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText28.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo27
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect27
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText28
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
            id: dbDescTxt27
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text101
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_MedGen_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX29
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn24
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_MedGen_Win.visible = false

                //videoX29.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect28
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView29
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp29
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn28
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX29.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText29.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo28
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect28
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText29
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
            id: dbDescTxt28
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text102
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: clinical_OMIM_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX30
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn25
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                clinical_OMIM_Win.visible = false

                //videoX30.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect29
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView30
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp30
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn29
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX30.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText30.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo29
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect29
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText30
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
            id: dbDescTxt29
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text103
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: pubchem_BioAssays_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX31
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn26
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                pubchem_BioAssays_Win.visible = false

                //videoX31.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect30
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView31
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp31
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn30
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX31.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText31.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo30
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect30
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText31
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
            id: dbDescTxt30
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text104
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: pubchem_Compounds_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX32
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn27
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                pubchem_Compounds_Win.visible = false

                //videoX32.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect31
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView32
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp32
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn31
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX32.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText32.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo31
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect31
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText32
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
            id: dbDescTxt31
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text105
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: pubchem_Pathways_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX33
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn28
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                pubchem_Pathways_Win.visible = false

                //videoX33.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect32
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView33
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp33
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn32
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX33.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText33.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo32
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect32
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText33
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
            id: dbDescTxt32
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text106
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: pubchem_Substances_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX34
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn29
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                mainWinDataSelect.visible = true
                pubchem_Substances_Win.visible = false

                //videoX34.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect33
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView34
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp34
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn33
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            layer.enabled: true
            palette.buttonText: "#ffffff"
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX34.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText34.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                transparentBorder: true
                horizontalOffset: 2
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo33
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect33
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText34
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
            id: dbDescTxt33
            x: 499
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text107
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Proteins Data:")
            font.pixelSize: 23
            font.bold: true
            font.underline: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: literaturedb_Bookshelf_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX35
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn30
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                literaturedb_Bookshelf_Win.visible = false

                //videoX35.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect34
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView35
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp35
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn34
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX35.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText35.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo34
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect34
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText35
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
            id: dbDescTxt34
            x: 528
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text108
            x: 337
            y: 106
            width: 177
            height: 34
            color: "#262af7"
            text: qsTr("Literature Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: literaturedb_MeSH_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX36
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn31
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                literaturedb_MeSH_Win.visible = false

                //videoX36.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect35
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView36
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp36
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn35
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX36.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText36.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo35
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect35
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText36
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
            id: dbDescTxt35
            x: 528
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text109
            x: 337
            y: 106
            width: 178
            height: 34
            color: "#262af7"
            text: qsTr("Literature Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: literaturedb_NLM_Catalog_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX37
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn32
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                literaturedb_NLM_Catalog_Win.visible = false

                //videoX37.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect36
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView37
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp37
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn36
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX37.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText37.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo36
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect36
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText37
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
            id: dbDescTxt36
            x: 522
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text110
            x: 337
            y: 106
            width: 160
            height: 34
            color: "#262af7"
            text: qsTr("Literature Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: literaturedb_PubMed_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX38
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn33
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                literaturedb_PubMed_Win.visible = false

                //videoX38.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect37
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView38
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp38
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn37
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX38.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText38.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo37
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect37
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText38
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
            id: dbDescTxt37
            x: 520
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text111
            x: 337
            y: 106
            width: 183
            height: 34
            color: "#262af7"
            text: qsTr("Literature Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }

    Rectangle {
        id: literaturedb_PubMed_Central_Win
        x: 0
        y: 0
        width: 1920
        height: 1080
        opacity: 1
        visible: false
        color: "#000000"
        Video {
            id: videoX39
            x: 0
            y: 0
            width: 1920
            height: 1080
            visible: true
            anchors.fill: parent
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            autoPlay: false
            clip: false
            focus: true
            loops: MediaPlayer.Infinite
        }

        Button {
            id: conservDomBackBtn34
            x: 8
            y: 8
            width: 100
            height: 40
            text: qsTr("Back")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                mainWinDataSelect.visible = true
                literaturedb_PubMed_Central_Win.visible = false

                //videoX39.play()
                //videoY.stop()
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Rectangle {
            id: dataWinRect38
            x: 337
            y: 143
            width: 1213
            height: 636
            color: "#000000"
            border.color: "#ffffff"
            ScrollView {
                id: scrollView39
                x: 8
                y: 8
                width: 1205
                height: 628
                TextArea {
                    id: textAreaTemp39
                    x: -4
                    y: -6
                    width: 731
                    height: 324
                    color: "#ffffff"
                    placeholderText: qsTr("")
                    font.pointSize: 11
                }
            }
        }

        Button {
            id: searchBtn38
            x: 337
            y: 804
            width: 100
            height: 40
            visible: true
            text: qsTr("Search")
            palette.buttonText: "#ffffff"
            layer.enabled: true
            onClicked: {
                //dataViewerWin.visible = true
                //mainWin.visible = false
                //videoX39.stop()
                //videoY.play()
                var databaseChoice = control3.currentIndex
                var userSearchterm = userSearchText39.text

                if(databaseChoice > 0){
                    networkManager.searchGenBankData(databaseChoice , userSearchterm)
                }
                else{
                    //Tell user to select a database
                }
            }
            layer.effect: DropShadow {
                width: 69
                color: "#ffffff"
                radius: 8
                horizontalOffset: 2
                transparentBorder: true
                samples: 17
                spread: 0
                verticalOffset: 2
            }
            background: Rectangle {
                color: "#161e20"
                radius: 50
            }
        }

        Image {
            id: decodeLogo38
            x: 822
            y: 13
            width: 277
            height: 67
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: userInputBgRect38
            x: 459
            y: 810
            width: 1091
            height: 28
            color: "#000000"
            border.color: "#ffffff"
            TextEdit {
                id: userSearchText39
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
            id: dbDescTxt38
            x: 522
            y: 108
            width: 864
            height: 29
            color: "#ffffff"
            text: qsTr("Conserved Domains Database | Conserved protein domains")
            font.pixelSize: 23
            font.bold: false
        }

        Text {
            id: text112
            x: 337
            y: 106
            width: 181
            height: 34
            color: "#262af7"
            text: qsTr("Literature Data:")
            font.pixelSize: 23
            font.underline: true
            font.bold: true
            styleColor: "#ffffff"
        }
    }
}
