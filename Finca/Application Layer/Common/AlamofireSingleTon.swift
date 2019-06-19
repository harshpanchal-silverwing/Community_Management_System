//
//  AlamofireSingleTon.swift
//  MadesInQatar
//
//  Created by anjali on 19/12/18.
//  Copyright © 2018 anjali. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamofireSingleTon: NSObject {
    // let baseUer = "https://www.silverwingtechnologies.com/products/bms/resident_api/"
    
    let baseUer = "https://www.fincasys.com/resident_api/"
   
     let key = "bmsapikey"
     static let sharedInstance = AlamofireSingleTon()

    func requestPost(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (Data?, NSError?) -> ()) {
        
        Alamofire.request(baseUer+serviceName, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
                
            case .success(_):
                if response.result.value != nil{
                    let json = JSON(response.data!)
                    print("json data" , json)
                    completionHandler(response.data,nil)
                }
                break
                
            case .failure(_):
                completionHandler(nil,response.result.error as NSError?)
                break
                
            }
        }
    }
    
    
    
}