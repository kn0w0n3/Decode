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
    width: 1280
    height: 720
    visible: true
    color: "#ffffff"
    title: qsTr("Decode")

    //Connections for passing data between C++ classes and QML GUI components
    //Main contrroller connections
    Connections {
        target: mainController
        onGBankFileData_T: {
            textAreaGenBankData.text += gBankData_T
            //textAreaTemp.text += gBankData_T

        }

    }
    //Network manger Connections
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
        width: 1280
        height: 720
        opacity: 1
        visible: false
        color: "#000000"

        Video {
            id: videoY
            x: 0
            y: 0
            width: 1280
            height: 720
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
                mainWin.visible = true
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
        id: mainWin
        x: 0
        y: 0
        width: 1280
        height: 720
        opacity: 1
        visible: true
        color: "#000000"

        Video {
            id: videoX
            x: 0
            y: 0
            width: 1280
            height: 720
            visible: true
            source: "/video/particle_bg.mp4"
            fillMode: VideoOutput.PreserveAspectCrop
            clip: false
            anchors.fill: parent
            loops: MediaPlayer.Infinite
            focus: true
            autoPlay: true
        }

        Rectangle {
            id: borderRect
            x: 227
            y: 105
            width: 826
            height: 440
            color: "#000000"
            border.color: "#ffffff"

            ScrollView {
                id: scrollView
                x: 8
                y: 8
                width: 810
                height: 424
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AsNeeded
                TextArea {
                    id: textAreaTemp
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
            x: 234
            y: 569
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
                networkManager.downloadGenBankData()

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
            x: 523
            y: 8
            width: 234
            height: 66
            source: "images/Text-Logo.png"
            fillMode: Image.PreserveAspectFit
        }

        ComboBox {
            id: control2
            x: 227
            y: 64
            width: 200
            height: 29

            model: ["Select Database", "Gene", "GEO DataSets", "GEO Profiles", "HomoloGene", "PopSet", "Assembly", "BioCollections",
                    "BioProject", "BioSample", "Genome", "Nucleotide", "SRA", "Taxonomy", "Conseved Domains", "Identical Protein Groups",
                    "Protein", "Protein Family Models", "Structure", "ClinicalTrials.gov", "ClinVar", "dbGaP","dbSNP","dbVaR", "GTR", "MedGen",
                    "OMIM", "blastsn", "blastsp", "blastx", "tblastn", "Primer-Blast", "BioAssays", "Compunds", "Pathways", "Substances"]

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
            x: 347
            y: 579
            width: 706
            height: 28
            color: "#000000"
            border.color: "#ffffff"

            TextEdit {
                id: textEdit
                x: 4
                y: 6
                width: 701
                height: 17
                color: "#ffffff"
                font.pixelSize: 15
                clip: true
            }
        }
    }
}
