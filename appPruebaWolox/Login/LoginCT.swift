//
//  LibraryCT.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation
import UIKit


protocol LoginView: class {
    func presentLibrary()
    func presentShow(vc : UIViewController)
    func alertM (text: String)
}

protocol LoginPresenter  {
    func login(nombre: String, apellido: String, email: String, edad: Int,checkTerminos:Bool)
}
