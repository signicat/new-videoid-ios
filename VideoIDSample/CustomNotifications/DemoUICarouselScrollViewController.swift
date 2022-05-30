//
//  DemoUICarouselScrollViewController.swift
//  SDKTester
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDLiteSDK

class DemoUICarouselScrollViewController: CustomCarouselScrollViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var currentStepLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageURLLabel: UILabel!
    @IBOutlet weak var audioLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.isHidden = false
        
        prevButton.isHidden = false
        nextButton.isHidden = false
        
      
        
        if let text = notification.action1Text {
            button1.isHidden = false
            button1.setTitle("Action 1: \(text)", for: .normal)
            
        }
        
        nameLabel.text = "Name:  \(notification.name ?? "")"
        titleLabel.text = "Title:  \(notification.title ?? "")"
        descriptionLabel.text = "Description:  \(notification.description ?? "")"
        currentStepLabel.text = "Current Step:  \(notification.currentStep ?? 0)"
        stepsLabel.text = "Total steps:  \(notification.steps ?? 0)"
    
        audioLabel.text = "Audio URL:  \(notification.audioUrl?.absoluteString ?? "")"
      imageURLLabel.text = "Animation URL:  \(notification.animationUrl?.absoluteString ?? "")"
        
        
        
        if(notification.steps == notification.currentStep){
            nextButton.isHidden = true
        }
        
        if(notification.currentStep == 1){
            prevButton.isHidden = true
        }
    }


    @IBAction func actionButton(_ sender: Any) {
        
        dismiss(animated: true) {
            
            guard let action = self.notification.action1 else {
                return
            }
            
            action()
        }
    }
    
    @IBAction func actionPrevButton(_ sender: Any) {
        dismiss(animated: true) {
            
            guard let action = self.notification.previous else {
                return
            }
            
            action()
        }
    }
    
    @IBAction func actionNextButton(_ sender: Any) {
        dismiss(animated: true) {
            
            guard let action = self.notification.next else {
                return
            }
            
            action()
        }
    }
    
}
