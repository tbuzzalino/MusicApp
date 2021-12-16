//
//  DataManager.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 18/11/2021.
//

import Foundation

class DataManager {
    
    static func cancionesPorGenero(canciones : [Track]) -> [Track] {
        return canciones.filter { x in
            x.genre != nil
        }
    }
}

//1,2,3,4,5,6,7,8,9,10
//
//vector.filter{
//     $0 /2 == 0
//
//}
