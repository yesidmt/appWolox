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

class LibraryRequestManager {
    
    private static var instance : LibraryRequestManager?
    
    static func current() -> LibraryRequestManager{
        if LibraryRequestManager.instance != nil{
           
            return LibraryRequestManager.instance!
        }else{
            LibraryRequestManager.instance = LibraryRequestManager()
            return LibraryRequestManager.instance!
        }
    }
    
    static func getAllLibrary(completion: @escaping ((_ librarys: [Library]) -> Void)){
      
        let url = "https://private-59a7d9-iostrainingapi.apiary-mock.com/books"
       AF.request(URL.init(string: url)!, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
        
           switch response.result {
              case .success(let value):
            
                let json = JSON(value)
                var librarys = [Library]()
                
                for item in json {
                    let title = item.1["title"].string ?? ""
                    let image = item.1["image"].string ?? ""
                    let id = item.1["id"].int ?? 0
                    let author = item.1["author"].string ?? ""
                    let year = item.1["year"].int ?? 0
                    let status = item.1["status"].string ?? ""
                    let genre = item.1["genre"].string ?? ""
                  
                    
                    let library =  Library(image: image, title: title, id: id, author: author, year: year, status: status, genre: genre)
                    librarys.append(library)
                   
                }
                
                completion(librarys)
           
              case .failure(let error):
                  print(error)
              }
        }
        
        
    }
   
    
}

