//
//  ViewController.swift
//  AgoraARKit Demo
//
//  Created by Hermes Frangoudis on 2/19/20.
//  Copyright © 2020 Agora.io. All rights reserved.
//

import UIKit

class ViewController: AgoraLobbyVC {
    
    override func loadView() {
        super.loadView()
        
        AgoraARKit.agoraAppId = ""

        
        // set the banner image within the initial view
        if let agoraLogo = UIImage(named: "ar-support-icon") {
            self.bannerImage = agoraLogo
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // MARK: Button Actions
    @IBAction override func joinSession() {
        if let channelName = self.userInput.text {
            if channelName != "" {
                let arAudienceVC = ARAudience()
                if let exitBtnImage = UIImage(named: "exit") {
                   arAudienceVC.backBtnImage = exitBtnImage
                }
                arAudienceVC.channelName = channelName
                arAudienceVC.modalPresentationStyle = .fullScreen
                self.present(arAudienceVC, animated: true, completion: nil)
            } else {
                // TODO: add visible msg to user
                print("unable to join a broadcast without a channel name")
            }
        }
    }

    @IBAction override func createSession() {
        if let channelName = self.userInput.text {
            if channelName != "" {
            let arBroadcastVC = ARBroadcaster()
            if let exitBtnImage = UIImage(named: "exit") {
               arBroadcastVC.backBtnImage = exitBtnImage
            }
            if let micBtnImage = UIImage(named: "mic"),
                let muteBtnImage = UIImage(named: "mute"),
                let watermakerImage = UIImage(named: "agora-logo") {
                arBroadcastVC.micBtnImage = micBtnImage
                arBroadcastVC.muteBtnImage = muteBtnImage
                arBroadcastVC.watermarkImage = watermakerImage
                arBroadcastVC.watermarkFrame = CGRect(x: self.view.frame.maxX-75, y: self.view.frame.maxY-75, width: 50, height: 50)
            }

            arBroadcastVC.channelName = channelName
            arBroadcastVC.modalPresentationStyle = .fullScreen
            self.present(arBroadcastVC, animated: true, completion: nil)
            } else {
              // TODO: add visible msg to user
              print("unable to launch a broadcast without a channel name")
            }
        }
    }
}

