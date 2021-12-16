//
//  UIViewController+extension.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 06/12/2021.
//
import UIKit
import Foundation
import CoreData

extension UIViewController {
    
    func showSimpleAlert(_ mensaje:String) {
        let alert = UIAlertController(title: "Download", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Descargando!", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func addedAlert(_ mensaje:String ) {
        let alert = UIAlertController(title: "Add!", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Added to playlist!", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alert(title: String, message: String, action: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: action, style: .default, handler: { _ in }))
            self.present(alert, animated: true, completion: nil)
        }
    
    func savedData() {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.managedObjectContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tracks")
            request.returnsObjectsAsFaults = false
            
            do {
                let result = try context!.fetch(request) // fetch nos da elementos no nulos
                misCanciones = [Track]()
                
                for data in result as! [NSManagedObject] {
                    let title = data.value(forKey: "title") as? String
                    let artist = data.value(forKey: "artist") as? String
                    let song_id = data.value(forKey: "song_id") as? String
                    let album = data.value(forKey: "album") as? String
                    let genre = data.value(forKey: "genre") as? String
                    
                    let track = Track(title: title ?? "",
                                      artist: artist ?? "",
                                      album: album ?? "",
                                      song_id: song_id ?? "",
                                      genre: genre ?? ""
                    )
                    misCanciones.append(track)
                }
                
            } catch {
                print("Falle al obtener info de la BD \(error), \(error.localizedDescription)")
            }
            
    //        if false {
            self.downloadTracks()
    //        }
            
        }
        
        func downloadTracks() {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.managedObjectContext
            
            RestServiceManager.shared.getToServer(responseType: [Track].self, method: .get, endpoint: "songs") { status, data in
                misCanciones = [Track]()
                if let _data = data {
                    misCanciones = _data
                    if let _context = context {
                        // Eliminar contenido
                        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Tracks")
                        let deleteRquest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                        do {
                            try appDelegate.persistentStoreCoordinator?.execute(deleteRquest, with: _context)
                        } catch {
                            print(error)
                        }
                        //Fin eliminar contenido
                        
                        //Agregar contenido a CoreData
                        for item in _data {
                            let trakcsEntity = NSEntityDescription.insertNewObject(forEntityName: "Tracks", into: _context)
                            trakcsEntity.setValue(item.artist, forKey: "artist")
                            trakcsEntity.setValue(item.title, forKey: "title")
                            trakcsEntity.setValue(item.song_id, forKey: "song_id")
                            trakcsEntity.setValue(item.genre, forKey: "genre")
                            trakcsEntity.setValue(item.album, forKey: "album")
                            
                            do {
                                try context?.save()
                            } catch {
                                print("No se guardo la info \(error), \(error.localizedDescription)" )
                            }
                        }
                    }
                }
            }
        }
    
    func moveToWelcomeScreen(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController
//        vc!.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(vc!, animated: true)
        self.present(vc!, animated: true)
    }
    
    func goToLoginController() {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        }
}

