//
//  APIManager.swift
//  Alamofire+wiftyJSON
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class APIManager
{
   static let mySingletone = APIManager()
    
   private init()
   {
    
   }
    
    func getUsersFromUrl(completion:@escaping (JSON)->Void)
    {
        let url = NSURL(string:fakeApi)
        var request = URLRequest(url: url! as URL)
        request.httpMethod="GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request).responseJSON {
            (jsonData) in
            
            switch jsonData.result
            {
            case .success(let data):
           
                let Data = JSON(data)
               // print(Data)
                
                completion(Data)
                
            case .failure(let error):
                // print("error",error)
                completion(nil)
                
            }
        }
        
        
    }
   
    
}
