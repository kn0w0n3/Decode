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
    Connections {
        target: mainController
        onGBankFileData_T: {
            textAreaGenBankData.text += gBankData_T
            textAreaTemp.text += gBankData_T

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
            text: qsTr("Data Viewer")
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
                dataViewerWin.visible = true
                mainWin.visible = false
                videoX.stop()
                videoY.play()
            }
        }

        Button {
            id: button1
            x: 590
            y: 569
            width: 100
            height: 40
            text: qsTr("Button")
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
            x: 952
            y: 569
            width: 100
            height: 40
            text: qsTr("Button")
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
    }
}
