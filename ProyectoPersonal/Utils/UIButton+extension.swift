//
//  UIButton+extension.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 25/11/2021.
//
import UIKit
import Foundation

extension UIButton {
    func bordered() {
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
    }
}
