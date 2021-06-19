//
//  LogoutVw.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 19/06/21.
//

import Foundation


import UIKit

class LogoutVW: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var mail: UILabel!
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Logout"
        setupFields()
    }

    func setupFields(){
        let arrayUser = userDefaults.object(forKey: "arrayUser") as! [String:Any]
        self.nombre.text = arrayUser["nombre"] as? String
        self.apellidos.text = arrayUser["apellido"] as? String
        self.edad.text = String(arrayUser["edad"] as! Int)
        self.mail.text = arrayUser["email"] as? String
    }

    @IBAction func logout(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "loginVW") as! LoginVW
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true, completion:nil)
        
    }
}
