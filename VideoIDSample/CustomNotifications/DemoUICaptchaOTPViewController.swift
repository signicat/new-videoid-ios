//
//  DemoUICaptchaOTPViewController.swift
//  SDKTester
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDLiteSDK

class DemoUICaptchaOTPViewController: CustomCaptchaOTPViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneUpdateLabel: UILabel!
    @IBOutlet weak var audioURLLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var charsetLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var button2: UIButton!
    
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
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
        phoneUpdateLabel.text = "Phone Update:  \(notification.phoneUpdate ?? "")"
        audioURLLabel.text = "Audio URL:  \(notification.audioUrl?.absoluteString ?? "")"
 
        lenghtLabel.text = "Lenght:  \(notification.length ?? 0)"
        charsetLabel.text = "Charset:  \(notification.charset?.rawValue ?? 0)"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        
        if codeTextField?.isFirstResponder == true {
            
            codeTextField?.resignFirstResponder()
            
        }
        
    }

    @IBAction func actionButton1(_ sender: Any) {
        dismiss(animated: true) {
            
            guard let action = self.notification.action1 else {
                return
            }
            
            action(self.codeTextField.text)
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
    

}
extension DemoUICaptchaOTPViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        return true
        
    }
    
}

