//
//  JSONHandler.swift
//  JSONDecoder using Alamofire in UIKit
//
//  Created by Md Khaled Hasan Manna on 7/7/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import Alamofire

class JSONHandler {
    
    
    var user = [UserModel]()
    weak var vc : ViewController?
    
    func getJSONDataAF(){
        
        AF.request("https://jsonplaceholder.typicode.com/users").response { (response) in
            
            guard let data = response.data else{return}
            
            do{
                
                self.user = try JSONDecoder().decode([UserModel].self, from: data)
                DispatchQueue.main.async {
            
                    self.vc?.tableView.reloadData()
                }
            
                
            }catch let parsingErr{
                print(parsingErr)
            }
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
}
