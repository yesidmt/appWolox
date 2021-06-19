//
//  LibraryCT.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation
import UIKit


protocol LibraryView: class {
    func presentShow(vc : UIViewController)
    func alertM (text: String)
    func present(vc : UIViewController)
    func updateTable()
    func showLoading(active: Bool)
}

protocol LibraryPresenter:UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate  {
    func prepareTableView(tableview: UITableView,searchBar: UISearchBar)
}
