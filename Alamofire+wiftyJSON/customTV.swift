//
//  customTV.swift
//  Alamofire+wiftyJSON
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class customTV: UITableView,UITableViewDelegate,UITableViewDataSource
{
    var myModel = [Model]()
    {
        didSet
        {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate=self
        self.dataSource=self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return self.myModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SingleCell
        let mymodel = myModel[indexPath.row]
        cell.singleTextView.text = "Name = \(mymodel.username)  Address = \(mymodel.address.city) Geo = \(mymodel.address.location.lat) CompanyName = \(mymodel.companyName.companyName)"
       return cell
        
    }
    
}
