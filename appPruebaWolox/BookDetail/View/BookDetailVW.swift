//
//  LibraryVW.swift
//  pruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 14/06/21.
//

import UIKit

class BookLibraryVW: UIViewController {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var buttoWhislist: UIButton!
    @IBOutlet weak var viewComment: UIView!
    
    var presenter: BookLibraryPresenter!
    var spinner : UIView?
    var library: [Library] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = BookLibraryPT(view: self)
        self.setupLibrary()
    }
    
    func setupLibrary(){
    
        self.title = "BOOK DETAIL"
        self.titulo.text = self.library[0].title
        self.status.text = self.library[0].status
        self.year.text = String(self.library[0].year)
        self.author.text = self.library[0].author
        self.genre.text = self.library[0].genre
        self.imagen.downloaded(from: self.library[0].image)
        
        viewDetail.layer.cornerRadius = 2
        viewDetail.layer.shadowColor = UIColor.gray.cgColor
        viewDetail.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewDetail.layer.shadowRadius = 5.0
        viewDetail.layer.shadowOpacity = 0.3
        
        viewComment.layer.cornerRadius = 2
        viewComment.layer.shadowColor = UIColor.gray.cgColor
        viewComment.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewComment.layer.shadowRadius = 5.0
        viewComment.layer.shadowOpacity = 0.3
        
        self.view.backgroundColor = ColorsApp().hexStringToUIColor(hex: Colors.azulFondo.rawValue)
        
        buttoWhislist.backgroundColor = .clear
        buttoWhislist.layer.cornerRadius = 5
        buttoWhislist.layer.borderWidth = 1
        buttoWhislist.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    
}

extension BookLibraryVW : BookLibraryView  {
    
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
