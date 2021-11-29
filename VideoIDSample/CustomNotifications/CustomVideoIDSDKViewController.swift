//
//  CustomMultimediaNotification.swift
//  ios-sdk-2.0
//
//  Created by César Sosa on 26/10/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import Foundation
import VideoIDSDK

class CustomVideoIDSDKViewController : BaseViewController {
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public init(environment: SDKEnvironment, docType:Int? = nil, language:String? = nil, docTypes:[Int]? = nil) {
        
        super.init(environment: environment)
        
        initializeVideoSDK(environment: environment, docType: docType, language: language, docTypes: docTypes)
        
    }
    
    @objc public init(environment: SDKEnvironment, docType:NSNumber? = nil, language:String? = nil, docTypes:[Int]? = nil) {
        
        super.init(environment: environment)
        
        initializeVideoSDK(environment: environment, docType: docType?.intValue, language: language, docTypes: docTypes)
        
    }
    
    override func getCustomErrorNotificationViewController(notification: ErrorNotification) -> CustomErrorNotificationViewController? {
        return DemoUIErrorViewController(notification: notification)
    }
    override func getCustomWarningNotification(notification: WarningNotification) -> CustomWarningNotificationViewController? {
        return DemoUIWarningNotificationViewController(notification: notification)
    }
    override func getCustomMultimediaNotification(notification: MediaNotification) -> CustomMediaNotificationViewController? {
        return DemoUIMediaNotificationViewController(notification: notification);
    }
    
    override func getCustomDocumentSelectionNotificationViewController(notification: DocumentSelectionNotification) -> CustomDocumentSelectionNotificationViewController? {
        return DemoUIDocumentSelectionViewController(notification: notification);
    }
    
    override func getCustomPhoneRequestViewController(notification: PhoneRequestNotification) -> CustomPhoneRequestViewController? {
        return DemoUIPhoneRequestViewController(notification: notification)
    }
    
    override func getCustomInfoItemsNotificationViewController(notification: InfoItemsNotification) -> CustomInfoItemsNotificationViewController? {
        return DemoUIInfoItemsNotificationViewController(notification: notification)
    }
    
    override func getCustomPermissionsInfoViewController(notification: CameraPermissionRequestNotification) -> CustomPermissionsInfoViewController? {
        return DemoUIPermissionsInfoViewController(notification: notification)
    }
    
    override func getCustomCarouselScrollViewController(notification: CarouselNotification) -> CustomCarouselScrollViewController {
        return DemoUICarouselScrollViewController(notification: notification)
    }
    
    override func getCustomCaptchaTextViewController(notification: CaptchaTextNotification) -> CustomCaptchaTextViewController? {
        return DemoUICaptchaTextViewController(notification: notification)
    }
    
    override func getCustomCaptchaOTPViewController(notification: CaptchaOTPNotification) -> CustomCaptchaOTPViewController? {
        return DemoUICaptchaOTPViewController(notification: notification)
    }
    
    
    
}
