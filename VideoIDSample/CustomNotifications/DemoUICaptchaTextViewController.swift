//
//  DemoUICaptchaTextViewController.swift
//  SDKTester
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDLiteSDK

class DemoUICaptchaTextViewController: CustomCaptchaTextViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var charsetlabel: UILabel!
    
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var audioURLLabel: UILabel!
    @IBOutlet weak var imageURLLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        button1.isHidden = true
        
        if let text = notification.action1Text {
            button1.isHidden = false
            button1.setTitle("Action 1: \(text)", for: .normal)
            
        }
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
        audioURLLabel.text = "Audio URL:  \(notification.audioUrl?.absoluteString ?? "")"
 
        imageURLLabel.text = "Image URL:  \(notification.imageUrl?.absoluteString ?? "")"
        
        lenghtLabel.text = "Lenght:  \(notification.length ?? 0)"
        imageURLLabel.text = "Charset:  \(notification.charset?.rawValue ?? 0)"
        
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
    

}
extension DemoUICaptchaTextViewController:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        return true
        
    }
    
}
