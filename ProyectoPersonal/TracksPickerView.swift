//
//  TracksPickerView.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 29/11/2021.
//

import UIKit

class TracksPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate : TracksPickerDelegate? // Creo la variable asociada al protocolo
    
    var picker : UIPickerView = UIPickerView()
    
    var btnDismiss : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        btn.tintColor = .orange
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.autoresizingMask = .flexibleLeftMargin
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return btn
    }()
    
    var btnAdd : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = .orange
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.autoresizingMask = .flexibleLeftMargin
        btn.addTarget(self, action: #selector(add), for: .touchUpInside)
        return btn
    }()
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cancion = misCanciones[row]
        return cancion.title
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        misCanciones.count
    }
    
    override func draw(_ rect: CGRect) {
        picker.frame = CGRect(x: 0, y: 20, width: rect.width, height: rect.height-30)
        picker.backgroundColor = .black
        picker.setValue(UIColor.orange, forKey: "textColor")
        picker.delegate = self
        picker.dataSource = self
        self.addSubview(picker)

        btnDismiss.frame=CGRect(x: 100, y: 45, width: 50, height: 80)
        self.addSubview(btnDismiss)

        btnAdd.frame = CGRect(x: 260, y: 45, width: 50, height: 80)
        self.addSubview(btnAdd)
    }
    
    @objc func dismiss() {
        self.removeFromSuperview()
    }
    
    @objc func add() {
        if delegate != nil {
        let index = picker.selectedRow(inComponent: 0)
        let track = misCanciones[index]
        delegate?.addTrack(track: track)

    }
    
}
}

protocol TracksPickerDelegate {
    
    func addTrack(track : Track)
    
}
