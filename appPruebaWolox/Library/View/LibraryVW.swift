//
//  LibraryVW.swift
//  pruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 14/06/21.
//

import UIKit

class LibraryVW: UIViewController {
    
    var presenter: LibraryPresenter!
    var spinner : UIView?
    @IBOutlet weak var tableLibrary: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LibraryPT(view: self)
        presenter.prepareTableView(tableview: tableLibrary,searchBar: searchBar)
        setupView ()
    }
    
    func setupView (){
        self.title = "LIBRARY"
        self.view.backgroundColor = ColorsApp().hexStringToUIColor(hex: Colors.azulFondo.rawValue)
        searchBar.layer.cornerRadius = 15
        searchBar.layer.masksToBounds = true
        
    }
    
}

extension LibraryVW : LibraryView  {
    func present(vc: UIViewController) {
        show(vc, sender: self)
    }
    
    func presentShow(vc : UIViewController){
        show(vc, sender: self)
    }
    
    func alertM (text: String) {
        // create the alert
        let alert = UIAlertController(title: "Alerta!", message: text, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateTable() {
        self.tableLibrary.reloadData()
    }
    func showLoading(active: Bool) {
        if active{
            spinner = LibraryVW.displaySpinner(onView: self.view)
        }else{
            if spinner != nil{
                LibraryVW.removeSpinner(spinner: spinner!)
            }
        }
        
    }
}
