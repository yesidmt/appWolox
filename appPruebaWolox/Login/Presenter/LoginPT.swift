//
//  LibraryCT.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation

class LoginPT: NSObject, LoginPresenter {

    private weak var view: LoginView!
    let userDefaults = UserDefaults.standard
    
    init(view: LoginVW) {
       self.view = view
        super.init()
    }
}

extension LoginPT{
    
    func login(nombre: String, apellido: String, email: String, edad: Int,checkTerminos:Bool) {
       
        
        if nombre.isEmpty{
            self.view.alertM(text: "Campo Nombre no debe estar vacio")
            return
        }else if apellido.isEmpty{
            self.view.alertM(text: "Campo Apellido no debe estar vacio")
            return
        }else if email.isEmpty{
            self.view.alertM(text: "Campo Email no debe estar vacio")
            return
        }else if edad == 0{
            self.view.alertM(text: "Debe escoger una edad valida")
            return
        }else if checkTerminos == false{
            self.view.alertM(text: "No has aceptado los terminos")
            return
        }else if !email.isValidEmail{
            self.view.alertM(text: "Email no valido")
            return
        }else {

            LoginRequestManager.loginRequest(completion: { [weak self] (status) in
                guard let _ = self else {
                    return
                }
            
                if status >= 200 && status < 300 {
                    let arrayUser = [
                        "nombre":nombre,
                        "apellido":apellido,
                        "email":email,
                        "edad":edad
                        
                    ] as [String : Any]
                    self!.userDefaults.set(arrayUser, forKey: "arrayUser")
                    self!.view.presentLibrary()
                    
                }else{
                    self!.view.alertM(text: "intentelo nuevamente")
                    return
                }
              
            })
            
        }
    }
    
}
