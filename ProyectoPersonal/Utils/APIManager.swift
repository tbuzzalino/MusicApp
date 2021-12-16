//
//  APIManager.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 18/11/2021.
//

//import Foundation
//import SystemConfiguration
//import Network
//
//class APIManager: ViewController {
//
//    var monitor: NWPathMonitor!
//
//    let baseURL = "https://raw.githubusercontent.com/beduExpert/Swift-Proyecto/main/API/db.json"
//
//    static let shared = APIManager()
//
//    func getMusic(completion: @escaping ([Track]?, Error?) -> ()) {
//        let url : String = baseURL
//        let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string:  url)! as URL)
//        request.httpMethod = "GET"
//        let session = URLSession.shared
//        let task = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
//            if error != nil {
//                completion(nil, error!)
//            }
//            else {
//                if let data = data {
//                    do {
//                        let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [ String : Any ]
//                        let songs = dict["songs"] as! [[String:Any]]
//                        let songsData = try JSONSerialization.data(withJSONObject: songs, options: .fragmentsAllowed)
//                        let result = try JSONDecoder().decode([Track].self, from: songsData)
//                        completion (result, nil)
//                    }
//                    catch {
//                        print (String(describing: error))
//                    }
//                }
//            }
//        }
//        task.resume()
//    }
//
//    func checkConnectivity()-> Int{
//            ///Internet Status = 1 --> Hay conexion a Internet
//            ///Internet Status = 0 --> Hay conexion a Internet pero es de Datos Moviles
//            ///Internet Status = -1 --> No hay conexion a Internet
//            var monitor:NWPathMonitor!
//            monitor = NWPathMonitor()
//            var internetEstatus = 1
//            monitor.pathUpdateHandler = { Path in
//
//                if Path.status == .satisfied {
//                    if Path.isExpensive { internetEstatus = 0 }
//                }
//                else {
//                    internetEstatus = -1
//                }
//            }
//            return internetEstatus
//        }
//}
//
//
//
//
