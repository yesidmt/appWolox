//
//  LoginPT.swift
//  pruebaFalabella
//
//  Created by yesid mendoza on 17/04/21.
//

import Foundation
import UIKit

class LibraryPT: NSObject, LibraryPresenter {
    
    private weak var view: LibraryView!
    var filteredLibrary: [Library] = []
    var allLibrary: [Library] = []
    
    init(view: LibraryVW) {
        self.view = view
        super.init()
    }
    
    func prepareTableView(tableview : UITableView,searchBar: UISearchBar){
        self.view.showLoading(active: true)
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        getAllLibrary()
    }
    
    func getAllLibrary()  {
        LibraryRequestManager.getAllLibrary(completion: { [weak self] (librarys) in
            guard let _ = self else {
                return
            }
            self?.allLibrary = librarys
            self!.filteredLibrary = librarys
            self?.view.updateTable()
            self!.view.showLoading(active: false)
            
        })
    }
}

extension LibraryPT {
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        
        return self.filteredLibrary.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as ListLibraryCell = cell else {
            return
        }
        
        cell.title.text = String(self.filteredLibrary[indexPath.row].title)
        cell.author.text = String(self.filteredLibrary[indexPath.row].author)
        cell.imageLibrary.downloaded(from: self.filteredLibrary[indexPath.row].image)
        
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.7,
            delay: 0.07 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
            })
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listLibraryCell", for: indexPath) as! ListLibraryCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let bookLibraryVW = storyboard.instantiateViewController(withIdentifier: "bookLibraryVW") as? BookLibraryVW {
            
            bookLibraryVW.library.append(self.filteredLibrary[indexPath.row])
            self.view.present(vc: bookLibraryVW)
            
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredLibrary = []
        if searchText == "" {
            self.filteredLibrary = allLibrary
        }else{
            
            for library in allLibrary {
                
                if library.title.lowercased().contains(searchBar.text!.lowercased()){
                    self.filteredLibrary.append(library)
                }
                
            }
        }
        
        self.view.updateTable()
    }
}
