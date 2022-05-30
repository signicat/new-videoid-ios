//
//  DemoUIPermissionsInfoViewController.swift
//  SDKTester
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDLiteSDK

class DemoUIPermissionsInfoViewController: CustomPermissionsInfoViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var audioURLLabel: UILabel!
    @IBOutlet weak var imageURLLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.isHidden = true
        
        if let text = notification.actionText {
            button1.isHidden = false
            button1.setTitle("Action 1: \(text)", for: .normal)
            
        }
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
        audioURLLabel.text = "Audio URL:  \(notification.audioUrl?.absoluteString ?? "")"
        imageURLLabel.text = "Image URL:  \(notification.imageURL?.absoluteString ?? "")"
    }

    @IBAction func actionButoon1(_ sender: Any) {
        dismiss(animated: true) {
            
            
            guard let action = self.notification.action else {
                return
            }
            
            action()
        }
    }
    
}
