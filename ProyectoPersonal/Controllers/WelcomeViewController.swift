//
//  WelcomeViewController.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 29/10/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var Welcome: UILabel!
    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        agregarGestosImagen()

    }
    
    @IBAction func dissmissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        goToLoginController()

    }

//    func goToLoginController() {
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
////        vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//            //navigationController?.pushViewController(vc!, animated: true)
//        }
    
    func agregarGestosImagen(){
            let gestureTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            self.personImg.addGestureRecognizer(gestureTap)
            self.personImg.isUserInteractionEnabled = true
        
//            let pichTap = UITapGestureRecognizer(target: self, action: #selector(didPinch(_:)))
//            self.personImg.addGestureRecognizer(pichTap	)
        }

        @objc func handleTap(_ sender: UITapGestureRecognizer){
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            let compilado = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
            let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""

            //Usar el popup
            alert(title: "Info", message: "Version: \(version)\n Compilado: \(compilado)\n \(appName)", action: "Confirmar")
            
        }
    
//    @objc func didPinch(_ sender: UIPinchGestureRecognizer){
//            if let scale = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)) {
//                       guard scale.a > 1.0 else { return }
//                       guard scale.d > 1.0 else { return }
//                        sender.view?.transform = scale
//                       sender.scale = 1.0
//            }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


