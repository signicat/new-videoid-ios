//
//  DemoUIPhoneRequestViewController.swift
//  SDKTester
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDLiteSDK

class DemoUIPhoneRequestViewController: CustomPhoneRequestViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var audioURLLabel: UILabel!
    @IBOutlet weak var imageURLLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var pickView: UIPickerView!
    
    
    var prefix = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneTextField.keyboardType = .numberPad
        
        button1.isHidden = true
        
        if let text = notification.actionText {
            button1.isHidden = false
            button1.setTitle("Action: \(text)", for: .normal)
            
        }
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        titleLabel.text = "Title:  \(notification.title ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
        audioURLLabel.text = "Audio URL:  \(notification.audioUrl?.absoluteString ?? "")"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        
        if phoneTextField?.isFirstResponder == true {
            
            phoneTextField?.resignFirstResponder()
            
        }
        
    }
    
    @IBAction func actionButton1(_ sender: Any) {
        
        dismiss(animated: true) {
            
            guard let action = self.notification.action else {
                return
            }
            
            action(self.prefix + self.phoneTextField.text!)
        }
    }
}


extension DemoUIPhoneRequestViewController :UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return (notification.prefixes?.count)!
    }
    
    
    
}

extension DemoUIPhoneRequestViewController :UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return notification.prefixes![row].title()
        }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        self.prefix = notification.prefixes![row].code!
    
    }
}
extension DemoUIPhoneRequestViewController:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        return true
        
    }
    
}
