//
//  DemoUIItemsListViewController.swift
//  SDKTester
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDSDK

class DemoUIInfoItemsNotificationViewController: CustomInfoItemsNotificationViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.isHidden = true
        
        if let text = notification.action1Text {
            
            button1.isHidden = false
            button1.setTitle("Action: \(text)", for: .normal)
        }
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        titleLabel.text = "Title:  \(notification.title ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
      
        self.notification.list?.forEach({ noti in
            //Text Label
            let textLabel = UILabel()
            textLabel.backgroundColor = UIColor.white
            textLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            textLabel.heightAnchor.constraint(equalToConstant: 11.0).isActive = true
            textLabel.text  = noti.text
            textLabel.textAlignment = .center
            
            stackView.addArrangedSubview(textLabel)
            
        })
    }


    @IBAction func actionButton1(_ sender: Any) {
        dismiss(animated: true) {
            
            guard let action = self.notification.action1 else {
                return
            }
            
            action()
        }
    }
    

}
