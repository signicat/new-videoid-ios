//
//  ViewController.swift
//  VideoIDSample
//
//  Created by César Sosa on 16/9/21.
//

import UIKit
import VideoIDSDK

class ViewController: UIViewController {

    let endpoint = "https://etrust-sandbox.electronicid.eu/v2"
    
    let bearer = ""
    let rAuthority = ""
    let language = "en"
    let documentID = 62 //Spain ID
    var getVideoIDAuthorizationInteractor: GetVideoIDAuthorizationInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getVideoIDAuthorizationInteractor = GetVideoIDAuthorizationInteractor()
    }
    @IBAction func startVideoIDwithCustomStyle(_ sender: Any) {
        
       
        VideoIDSDK.Style.Roi.linesColorSuccess = UIColor.blue
        VideoIDSDK.Style.MediaNotification.descriptionTextColor = UIColor.blue
        VideoIDSDK.Style.LinkButton.backgroundColorNormal = UIColor.blue
        VideoIDSDK.Style.TextNotification.textColor = .blue
        VideoIDSDK.Style.MediaNotification.descriptionTextColor = .blue
        VideoIDSDK.Style.MediaNotification.textFont = FontType.regular.font(size: 28)
        startVideoIDSDK()
    }
    
    @IBAction func startVIdeoIDCustomNotification(_ sender: Any) {
        getVideoIDAuthorizationInteractor?.getAuthorizationFor(endpoint: self.endpoint,
                                                               bearer: self.bearer,
                                                               rAuthority: self.rAuthority,
                                                               onResult: { (auth) in
                                                                
                                                                
                                                                let environment: VideoIDSDK.SDKEnvironment = VideoIDSDK.SDKEnvironment(url: self.endpoint, authorization: auth!)
                                                                
                                                                DispatchQueue.main.async {
                                                                    
                                                                    let view = CustomVideoIDSDKViewController(
                                                                        environment: environment,
                                                                        docType: self.documentID,
                                                                        language:  self.language)
                                                                    
                                                                    
                                                                    view.modalPresentationStyle = .fullScreen
                                                                    view.delegate = self
                                                                    self.present(view,
                                                                                 animated: true, completion: nil)
                                                                    
                                                                }
                                                                
                                                               }) { (error) in
            self.onError(code: "Error", message: "No se pudo crear autorizacion")
        }
    }
    

    func startVideoIDSDK(){
        
        getVideoIDAuthorizationInteractor?.getAuthorizationFor(endpoint: self.endpoint,
                                                               bearer: self.bearer,
                                                               rAuthority: self.rAuthority,
                                                               onResult: { (auth) in
                                                                
                                                                
                                                                let environment: VideoIDSDK.SDKEnvironment = VideoIDSDK.SDKEnvironment(url: self.endpoint, authorization: auth!)
                                                                
                                                                DispatchQueue.main.async {
                                                                    
                                                                    let view = VideoIDSDK.VideoIDSDKViewController(environment: environment, docType:self.documentID, language: self.language)
                                                                    view.modalPresentationStyle = .fullScreen
                                                                    view.delegate = self
                                                                    self.present(view,
                                                                                 animated: true, completion: nil)
                                                                    
                                                                }
                                                                
                                                               }) { (error) in
            self.onError(code: "Error", message: "No se pudo crear autorizacion")
        }
    }
    
    @IBAction func startVideo(_ sender: Any) {
        startVideoIDSDK()
    }
    
}
extension ViewController : VideoIDSDK.VideoIDDelegate{
    func onComplete(videoID: String) {
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: "Success", message: "VideoID: \(videoID)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func onError(code: String, message: String?) {
        
            DispatchQueue.main.async {
                
                let alert = UIAlertController(title: "Error", message: "Message: \(message!)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
    }
    
    
}
