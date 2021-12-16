//
//  RegisterViewController.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 27/10/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var signUpTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.labelProps()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "ColorPrimario")
        label.textColor = UIColor(named: "ColorSecundario")

    }

    
    @IBAction func registerBtn(_ sender: Any) {
        
        var tipoDeError : Int = 0
        var newUser : String?
        var newPassword : String?
        
        newUser = signUpTextField.text
        newPassword = passwordTextField.text
        
        guard let userName = newUser, let password = newPassword else {
            return
        }
        
        tipoDeError = validaciones(userName : userName, password: password)
        switch tipoDeError {
        case 1 :
            print("El username tiene mas longitud.")
            signUpTextField.shake()
            passwordTextField.shake()
        case 2 :
            print("El email tiene que tener un @ para ser valido.")
            signUpTextField.shake()
        case 3 :
            print("El campo password no puede estar vacio.")
            passwordTextField.shake()
        case 4 :
            print("La password tiene que tener mas de 10 caracteres.")
        default :
            moveToWelcomeScreen()
            savedData()
            print("Paso todas las verificaciones.")
        }
        
    }
   
    func validaciones(userName : String, password : String ) -> Int {
        var numero = 0
        if userName.isEmpty {
            numero = 1
        }
        if userName.contains("@") && userName.count < 10 {
            numero = 2
        }
        if password.isEmpty {
            numero = 3
        }
        if password.count < 10 {
            numero = 4
        }
        return numero
    }
   
    @IBAction func logout(_ sender: Any) {
        dismiss(animated: true)
        goToLoginController()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var signupLbl: UILabel!
    @IBAction func facebookBtn(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
