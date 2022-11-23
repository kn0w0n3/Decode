import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12
import QtQuick.Layouts 1.12



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
    color: "#8ae234"
    title: qsTr("Decode")

    Rectangle {
        id: mainWin
        x: 0
        y: 0
        width: 1280
        height: 720
        opacity: 1
        color: "#ffffff"

        Image {
            id: image
            x: 0
            y: 0
            width: 1280
            height: 720
            source: "images/decode-bg-1.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: borderRect
            x: 227
            y: 105
            width: 826
            height: 440
            color: "#ffffff"

            Video {
                id: videoX
                x: 100
                y: 4
                //width : 1180
                //height : 716
                visible: true
                //source: "/home/voldem0rt/Documents/Qt_Projects/AntigenX-main/video/lightning.avi"
                source: "video/1075857926-preview.mp4"
                anchors.rightMargin: 8
                anchors.bottomMargin: 8
                anchors.topMargin: 8
                fillMode: VideoOutput.PreserveAspectCrop
                anchors.leftMargin: 8
                clip: false
                anchors.fill: parent
                loops: MediaPlayer.Infinite
                focus: true
                //layer.enabled: true
                autoPlay: true
                //play: false
                //MouseArea {
                //anchors.fill: parent
                //onClicked: {
                //videoX.play()
                //}
                // }
                //Keys.onSpacePressed: videoX.playbackState == MediaPlayer.PlayingState ? videoX.pause() : videoX.play()
                //Keys.onLeftPressed: videoX.position = videoX.position - 5000
                //Keys.onRightPressed: videoX.position = videoX.position + 5000
            }
        }

        Button {
            id: button
            x: 234
            y: 569
            visible: true
            text: qsTr("Button")
        }

        Button {
            id: button1
            x: 590
            y: 569
            text: qsTr("Button")
        }

        Button {
            id: button2
            x: 952
            y: 569
            text: qsTr("Button")
        }



    }



}
