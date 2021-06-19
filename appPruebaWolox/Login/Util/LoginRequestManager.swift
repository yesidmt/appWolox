//
//  LoginRequestManager.swift
//  pruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 14/06/21.
//

import Foundation
import Combine
import SwiftyJSON
import Alamofire

class LoginRequestManager {
    
    private static var instance : LoginRequestManager?
    
    static func loginRequest(completion: @escaping ((_ status: Int) -> Void)){
      
        let parameters =
        [
            "name": "John",
            "lastname": "Smith",
            "email": "mrsmith@gmail.com",
            "age": 28
        ] as [String : Any]
        
        AF.request("https://private-anon-83c78d06b6-iostrainingapi.apiary-mock.com/signin", method: .post,  parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        if let json = value as? [String: Any] {
                            print(json)
                            let statusCode = response.response?.statusCode
                            completion(statusCode!)
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
    }
    
}
