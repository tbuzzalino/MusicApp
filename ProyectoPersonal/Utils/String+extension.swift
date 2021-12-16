//
//  String.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 06/12/2021.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regExp = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$", options: [])
        let coincidencias = regExp.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        
        return coincidencias.count > 0 ? true : false
    }
}
