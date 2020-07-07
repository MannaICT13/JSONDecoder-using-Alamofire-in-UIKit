//
//  ViewController.swift
//  JSONDecoder using Alamofire in UIKit
//
//  Created by Md Khaled Hasan Manna on 7/7/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var jHandlerInstance = JSONHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        jHandlerInstance.vc = self
        jHandlerInstance.getJSONDataAF()
        jHandlerInstance.vc = self
        
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
       
    }
    
    
    


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return jHandlerInstance.user.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        cell.idLbl.text = String(jHandlerInstance.user[indexPath.row].id!)
        cell.nameLbl.text = jHandlerInstance.user[indexPath.row].name
        cell.emailLbl.text = jHandlerInstance.user[indexPath.row].email
        return cell
    }
    
    
}
