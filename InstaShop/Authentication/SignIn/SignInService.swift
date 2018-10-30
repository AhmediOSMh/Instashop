//
//  SignInService.swift
//  InstaShop
//
//  Created by mouadh allani on 10/21/18.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class SignInService: NSObject {
    
    func authentication(params: [String: Any], completion : @escaping (Bool?) -> Void) {
        let url = AuthenticationURL
        
        Alamofire.request(url, method: .get, parameters: params, headers : nil).responseJSON { (data) in
            
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
            if let result = json["Exist"]  as? Int {
                if(result == 1){
                    var user:User!
                    user.mapping(map: (json["User"] as? [String:Any]));
                    return true
                }else{
                    return false
                }
                
            }
        }
        
        return nil
    }
}
