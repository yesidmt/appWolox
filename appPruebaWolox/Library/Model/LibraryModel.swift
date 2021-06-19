//
//  libraryModel.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation

struct Library:Codable {
    
    var image : String
    var title : String
    var id : Int
    var author : String
    var year : Int
    var status : String
    var genre : String
}
