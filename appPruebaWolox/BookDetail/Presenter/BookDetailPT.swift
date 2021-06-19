//
//  LibraryCT.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation

class BookLibraryPT: NSObject, BookLibraryPresenter {

    private weak var view: BookLibraryView!

    init(view: BookLibraryVW) {
       self.view = view
        super.init()
    }
}

