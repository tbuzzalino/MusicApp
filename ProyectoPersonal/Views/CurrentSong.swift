//
//  CurrentSong.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 23/11/2021.
//

import Foundation

class CurrentSong {
    var name : String
    var genre  : String
    
    init(name : String, genre : String){
        self.name = name
        self.genre =  genre
    }
    
    func getSongName () -> String {
        return self.name
    }
}
