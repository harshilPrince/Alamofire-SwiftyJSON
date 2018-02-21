//
//  ViewController.swift
//  Alamofire+wiftyJSON
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    
    
    @IBOutlet weak var customTV: customTV!
    var myResponse:JSON = nil
    var users: [Model] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        requestData()
    }
    
    func requestData()
    {
        
        
       APIManager.mySingletone.getUsersFromUrl()
        {
           (JSONData)-> Void in
            
            if JSONData != nil
            {
                self.myResponse = JSONData
                for i in 0..<self.myResponse.count
                {
                   
                    let userJSON = Model(userJson: self.myResponse[i])
                    print(userJSON)
                    self.users.append(userJSON)
                    
                }
                
                DispatchQueue.main.async
                    {
                    self.customTV.myModel=self.users
                    self.customTV.reloadData()
                    }
               
                
            }
            
            
        }
    }


}

