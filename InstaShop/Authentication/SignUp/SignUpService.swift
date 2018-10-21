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
    
    func execute(params: [String: Any], completion : @escaping (Bool?) -> Void) {
        let url = signUpURL
        
        
        Alamofire.request(url, method: .post, parameters: params, headers : nil).responseJSON { (data) in
            
            switch data.result {
                
            case .success(let data):
                debugPrint("data ===>", data)
                let result: Bool? = self.handleMappingResponse(data: data)
                completion(result)
                
            case .failure(let error):
                debugPrint("error ===>", error)
                completion(nil)
            }
        }
    }
    
    func handleMappingResponse(data : Any) -> Bool? {
        
        if let json = data as? [String : Any] {
            print(json)
            if let result = json["result"]  as? String {
                if(result == "success"){
                    return true
                }}
        }
        
        return nil
    }
}
