//
//  LoginViewController.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 22/10/2021.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var enterUsername: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var continueBordered: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    var viewmodel : LoginViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBordered.bordered()
        signUpOutlet.bordered()
        
        usernameField.text = "tomibuzz@gmail.com"
        passwordField.text = "marcoscrack"
        var viewmodel = LoginViewModel()
    }
    
    var model : Registered = Registered()

    @IBOutlet var backgroundColor: UIView!
    
    @IBAction func `continue`(_ sender: UIButton) {
        
        var tipoDeError : Int = 0
        var newUser : String?
        var newPassword : String?
        

        newUser = usernameField.text
        newPassword = passwordField.text
        
        viewmodel?.buttonTouched(newUser: usernameField, newPassword: passwordField)
        
        guard let userName = newUser, let password = newPassword else {
            return
        }
        tipoDeError = validaciones(userName : userName, password: password)
        
        if (tipoDeError == 5){
            savedData()
            moveToWelcomeScreen()
        } else {
            usernameField.shake()
            passwordField.shake()
        }
        
//        switch tipoDeError {
//        case 1 :
//            print("El username esta vacio.")
//            usernameField.shake()
//        case 2 :
//            print("El email tiene que tener un @ para ser valido.")
//            usernameField.shake()
//        case 3 :
//            print("El campo password no puede estar vacio.")
//            passwordField.shake()
//        case 4 :
//            print("La password tiene que tener mas de 10 caracteres.")
//        case 5 :
//            print("El usuario se encuentra en registrado.")
//
//            savedData()
//            moveToWelcomeScreen()
//        default :
//            moveToWelcomeScreen()
//            print("Paso todas las verificaciones.")
//        }
 
    

    func validaciones(userName : String, password : String ) -> Int {
        var numero = 0
        if userName.isEmpty {
            numero = 1
        }
        if userName.isValidEmail() && userName.count < 10 {
            numero = 2
        }
        if password.isEmpty {
            numero = 3
        }
        if password.count < 10 {
            numero = 4
        }
        if model.user1.user == userName && model.user1.pass == password {
            numero = 5
            
        }
        return numero
    }
    
    moveToWelcomeScreen()
    
}
    
}
