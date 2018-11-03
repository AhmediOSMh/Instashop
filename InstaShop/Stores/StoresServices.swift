//
//  StoresServices.swift
//  InstaShop
//
//  Created by Ahmed Mh on 03/11/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class StoresServices: NSObject {
    
    func getAllStores(params: [String: Any], completion : @escaping ([[String : Any]]?) -> Void) {
        let url = AllStoresURL
        
        Alamofire.request(url, method: .get, parameters: params, headers : nil).responseJSON { (data) in
            
            switch data.result {
                
            case .success(let data):
                debugPrint("data ===>", data)
                let result: [[String : Any]]? = self.handleMappingResponse(data: data)
                completion(result)
            case .failure(let error):
                debugPrint("error ===>", error)
                completion(nil)
            }
        }
    }
    
    func handleMappingResponse(data : Any) -> [[String:Any]]? {
        
        if let json = data as? [String : Any] {
            if (json["STORES"]  as? [[String:Any]]) != nil {
               

                return json["STORES"] as! [[String : Any]]
                }else{
                    return []
                }
                
            }
        return nil
        }
        
    
}

