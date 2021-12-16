//
//  HighlightButton.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 23/11/2021.
//

import UIKit

class ButtonFunc: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var icon : UIImage?
    var secondIcon : UIImage?
    var isPlaying : Bool = false
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.tintColor = UIColor(named: "ColorPrimario")
    }
    
    func performTwoStateSelection () {
        self.isPlaying = !isPlaying
        
        self.setImage( isPlaying ? icon : secondIcon, for: .normal)
        self.setImage(isPlaying ? icon : secondIcon, for: .highlighted)
    }
    
    func setImage(icon : UIImage?) {
        guard let icon = icon else { return }
        self.icon = icon
        self.setImage(icon, for: .normal)
        self.setImage(icon, for: .highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleColor(.red, for: .highlighted)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                backgroundColor = .green
            }
            else {
                backgroundColor = .orange
            }
            super.isHighlighted = newValue
        }
    }

}
