//
//  SignUpService.swift
//  InstaShop
//
//  Created by Ahmed Mh on 16/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class SignUpService: NSObject {
    
    func execute(params: [String: Any], completion : @escaping (String?) -> Void) {
        let url = signUpURL
        
        
        Alamofire.request(url, method: .get, parameters: params, headers : nil).responseJSON { (data) in
            
            switch data.result {
                
            case .success(let data):
                debugPrint("data ===>", data)
                let result: String? = self.handleMappingResponse(data: data)
                completion(result)
                
            case .failure(let error):
                debugPrint("error ===>", error)
                completion(nil)
            }
        }
    }
    
    func handleMappingResponse(data : Any) -> String? {
        
        if let json = data as? [String : Any] {
            print(json)
            if let result = json["error_code"]  as? String {
                if(result == "0"){
                    return (json["message"]  as? String)!
                }
                return (json["message"]  as? String)! + " " + (json["error_message"]  as? String)!

            }
        }
        
        return nil
    }
}
