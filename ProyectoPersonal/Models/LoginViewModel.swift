
//  LoginViewModel.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 15/12/2021.


import Foundation

class LoginViewModel : UIViewController {
    
    var model : Registered = Registered()
    var tipoDeError : Int = 0
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

    func buttonTouched(newUser : UITextField, newPassword : UITextField) {
        
        var nuevoUsuario = newUser.text
        var nuevaPassword = newPassword.text
        
        
        guard let usuario = nuevoUsuario, let password = nuevaPassword else { return }
        
        tipoDeError = validaciones(userName : usuario, password: password)
        
        
        if (tipoDeError == 5){
            savedData()
            moveToWelcomeScreen()
        } else {
            newUser.shake()
            newPassword.shake()
        }
        
    }

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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
//func moveToWelcomeScreen(){
//    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController
////        vc!.modalPresentationStyle = .fullScreen
////        self.navigationController?.pushViewController(vc!, animated: true)
//    self.present(vc!, animated: true)
}

}

