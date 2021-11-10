//
//  Piece.swift
//  ChessAI
//
//  Created by Freddie Nunn on 30/08/2021.
//

import Foundation

class Piece: ObservableObject{

    let name: String
    let id: String
    var position: [Int]
    @Published var isAlive = false
    
    init(name: String, id: String, position: [Int]) {
        self.name = name
        self.id = id
        self.position = position
    }
    
    #if DEBUG
    static let example = Piece(name: "wpawn", id: "wpawn1", position: [1, 2])
    #endif
}
