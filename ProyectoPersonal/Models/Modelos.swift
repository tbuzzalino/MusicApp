//
//  Modelos.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 29/10/2021.
//

import Foundation

struct Account {
    let user : String
    let pass : String
}

struct Registered {
  let user1: Account = Account(user: "tomibuzz@gmail.com", pass: "marcoscrack")
}


struct Track : Codeable, Decodable, Hashable {

    let title: String

    let artist: String?

    let album: String?
    
    let song_id : String
    
    let genre : String?
    
//    let duration : Double?
    enum CodingKeys : String, CodingKey {
        case artist
        case title = "name"
        case album
//        case duration
        case genre = "genre"
        case song_id = "song_id"
    }

}

enum Genero : String, Codable {
    case Rock
    case Pop
    case Folclore
    case Vacio = ""
}

enum PlayerStates {
    case play
    case pause
    case next
    case previous
}

enum MenuOption: Int {
    case deleteFromLibrary = 0
    case download
    case addToPlaylist
}

var misCanciones = [Track]()


//var misCanciones = [Track(title: "Do i Wanna know", artist: "Artic Monkeys", album: "AM", song_id: "1", genre: "rock", duration : nil),
//                   Track(title: "Why you only call me when youre high", artist: "Artics Monkeys", album: "AM",song_id: "2", genre: "rock", duration : nil),
//                   Track(title: "R U Mine", artist: "Artics Monkeys", album: "AM", song_id: "3", genre: "rock", duration : nil),
//                   Track(title: "Knee Socks", artist: "Artics Monkeys", album: "AM", song_id: "4", genre: "rock", duration : nil),
//                   Track(title: "Arabella", artist: "Artics Monkeys", album: "AM", song_id: "5", genre: "rock", duration : nil),
//                   Track(title: "No 1 party anthem", artist: "Artics Monkeys", album: "AM", song_id: "6", genre: "rock", duration : nil),
//                   Track(title: "I want i all", artist: "Artics Monkeys", album: "AM", song_id: "7", genre: "rock", duration : nil),
//                   Track(title: "Why you only call me when youre high", artist: "Artics Monkeys", album: "AM", song_id: "8", genre: "rock", duration : nil)]





