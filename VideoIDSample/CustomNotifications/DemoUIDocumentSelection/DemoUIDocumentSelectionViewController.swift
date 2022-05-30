//
//  DemoUIDocumentSelectionViewController.swift
//  ios-sdk-2.0
//
//  Created by César Sosa on 8/11/21.
//  Copyright © 2021 Electronic Identification S.L. All rights reserved.
//

import UIKit
import VideoIDLiteSDK

class DemoUIDocumentSelectionViewController: CustomDocumentSelectionNotificationViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let docTypeIdentifier = "docTypeIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DocumentSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: docTypeIdentifier)
        
        tableView.rowHeight = 160
        

        // Do any additional setup after loading the view.
    }
    
    func selectIDType(IDType: Int){
        dismiss(animated: true) {
            
            
            guard let action = self.notification.action else {
                return
            }
            action(IDType)
            
        }
        
    }




}

extension DemoUIDocumentSelectionViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (notification.idTypes?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: docTypeIdentifier)! as! DocumentSelectionTableViewCell
           
        
        cell.name?.text  = (notification.idTypes?[indexPath.row])!.name
        cell.country?.text  = (notification.idTypes?[indexPath.row])!.countryName
        cell.idType?.text  = "\((notification.idTypes?[indexPath.row])!.id!)"
         
          return cell
    }
    
    
}

extension DemoUIDocumentSelectionViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let iDType = (notification.idTypes![indexPath.row])
        
        self.selectIDType(IDType: iDType.id!)
    }
}
