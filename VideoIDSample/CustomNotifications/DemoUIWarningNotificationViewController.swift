//
//  DemoUIWarningNotificationViewController.swift
//  SDKTester
//
//  Created by César Sosa on 9/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDSDK

class DemoUIWarningNotificationViewController: CustomWarningNotificationViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var audioURLLabel: UILabel!
    @IBOutlet weak var imageURLLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.isHidden = true
        button2.isHidden = true
        
        if let text = notification.action1Text {
            button1.isHidden = false
            button1.setTitle("Action 1: \(text)", for: .normal)
            
        }
        
        if let text = notification.action2Text {
            button2.isHidden = false
            button2.setTitle("Action 2: \(text)", for: .normal)
            
        }
        
        if let text = notification.action3Text {
            button3.isHidden = false
            button3.setTitle("Action 3: \(text)", for: .normal)
            
        }
        
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        titleLabel.text = "Title:  \(notification.title ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
        audioURLLabel.text = "Audio URL:  \(notification.audioUrl?.absoluteString ?? "")"
        imageURLLabel.text = "Image URL:  \(notification.imageURL?.absoluteString ?? "")"
        
    }


    @IBAction func actionButton1(_ sender: Any) {
        dismiss(animated: true) {
            
            
            guard let action = self.notification.action1 else {
                return
            }
            
            action()
        }
        
    }
    

    @IBAction func actionButton2(_ sender: Any) {
        dismiss(animated: true) {
            
            
            guard let action = self.notification.action2 else {
                return
            }
            
            action()
        }
    }
    
    @IBAction func actionButton3(_ sender: Any) {
        dismiss(animated: true) {
            
            
            guard let action = self.notification.action3 else {
                return
            }
            
            action()
        }
    }
    
    
}
