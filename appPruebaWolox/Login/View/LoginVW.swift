//
//  LibraryCT.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import UIKit

class LoginVW: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imgLogin: UIImageView!
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellido: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var datePickertxt: UITextField!
    @IBOutlet weak var checkTerminos: UISwitch!
    
    var presenter: LoginPresenter!
    let datePick = UIDatePicker()
    var edad = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        presenter = LoginPT(view: self)
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
        self.imgLogin.layer.cornerRadius = 10.0
        self.createDatePicker()
    }
    
    func createDatePicker () {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // doneButton
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        toolbar.setItems([doneButton], animated: true)
        datePickertxt.inputAccessoryView = toolbar
        datePickertxt.inputView = datePick
        datePick.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            datePick.preferredDatePickerStyle = .wheels
        }
        
        datePick.maximumDate = Date()
    }
    @objc func donePress(){
        
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        datePickertxt.text = formater.string(from: datePick.date)
        self.view.endEditing(true)
        
        let gregorian = Calendar(identifier: .gregorian)
        let ageComponents = gregorian.dateComponents([.year], from: datePick.date, to: Date())
        self.edad = ageComponents.year!
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        presenter.login(nombre: self.nombre.text!, apellido: self.apellido.text!,email: self.email.text!, edad: self.edad,checkTerminos:self.checkTerminos.isOn)
    }
    @objc func tapGestureHandler() {
        
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.apellido.resignFirstResponder()
        performAction()
        return true
    }
    
    func performAction() {
        presenter.login(nombre: self.nombre.text!, apellido: self.apellido.text!,email: self.email.text!, edad: self.edad,checkTerminos:self.checkTerminos.isOn)
    }
    
}

extension LoginVW : LoginView  {
    
    func presentShow(vc : UIViewController){
        show(vc, sender: self)
    }
    func presentLibrary(){
        
        self.performSegue(withIdentifier: "goTabbar", sender: self)
    }
    
    func alertM (text: String) {
        // create the alert
        let alert = UIAlertController(title: "Alerta!", message: text, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
