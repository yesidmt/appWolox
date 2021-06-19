//
//  LibraryCT.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation
import UIKit


protocol BookLibraryView: AnyObject {
    func presentShow(vc : UIViewController)
    func alertM (text: String)
}

protocol BookLibraryPresenter  {
  
}
