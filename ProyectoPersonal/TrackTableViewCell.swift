//
//  TrackTableViewCell.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 04/11/2021.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    var title : UILabel = {
        var nombreArtista = UILabel()
        nombreArtista.font = UIFont.systemFont(ofSize: 12)
        nombreArtista.textColor = UIColor(named: "ColorSecundario")
        return nombreArtista
    }()
    
    var cancion : UILabel = {
        var labelCancion = UILabel()
        labelCancion.textColor = UIColor(named : "ColorSecundario")
        return labelCancion
    }()
    
    var playButton : ButtonFunc = {
        let botonPlay = ButtonFunc()
        botonPlay.backgroundColor = UIColor(named: "ColorSecundario")
        botonPlay.icon = UIImage(named: "Play")
        botonPlay.secondIcon = UIImage(named: "Pause")
        botonPlay.performTwoStateSelection()
        botonPlay.addTarget(self, action: #selector(callButton), for: .touchUpInside)
        botonPlay.layer.cornerRadius = 20
        return botonPlay
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var track : Track?
    var parent : ButtonOnCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nuevoBoton = UIImageView()
        nuevoBoton.image = UIImage(named: "NotaMusical")
        nuevoBoton.autoresizingMask = .flexibleWidth
        nuevoBoton.translatesAutoresizingMaskIntoConstraints = true
        nuevoBoton.frame = CGRect(x: 6, y: 10, width: 0, height: 40)
        nuevoBoton.tintColor = .orange
        nuevoBoton.layer.cornerRadius = 10
        
        nuevoBoton.backgroundColor = .white
        self.contentView.addSubview(nuevoBoton)
        
        title.frame = CGRect(x: 110, y: 4, width: 140, height: 20)
        self.contentView.addSubview(title)
        
        cancion.frame = CGRect(x: 110, y: 40, width: 140, height: 14)
        self.contentView.addSubview(cancion)
        
        playButton.frame = CGRect(x: 340, y: 4, width: 40, height: 40)
        self.contentView.addSubview(playButton)
        
    }
    
    @objc func callButton () {
        guard let parent = parent else {return}
        playButton.performTwoStateSelection()
        parent.buttonTouchedOnCell(celda: self)

    }
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
        }
    

}
