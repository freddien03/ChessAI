//
//  Piece.swift
//  ChessAI
//
//  Created by Freddie Nunn on 30/08/2021.
//

import Foundation

class Piece: ObservableObject{

    let name: String
    var type: String
    let id: String
    @Published var position: [Int]
    @Published var isAlive = false
    
    init(name: String, id: String, position: [Int]) {
        self.name = name
        self.type = self.name
        self.type.removeFirst()
        self.id = id
        self.position = position
    }
    
    func calculateMoves(chessBoard: ChessBoard) -> [Coord] {
        var positions: [Coord] = []
        switch self.type{
        case "pawn":
            if let _ = chessBoard.checkForPiece(position: [self.position[0], self.position[1]+1]){
                
            }else{
                positions.append(Coord(x: self.position[0], y: self.position[1]+1))
            }
            for i in stride(from: 0, to: 2, by: 2) {
                if let _ = chessBoard.checkForPiece(position: [self.position[0], self.position[1]-1+i]){
                    positions.append(Coord(x: self.position[0], y: self.position[1]-1+i))
                }
            }
        case "rook":
            for i in self.position[0]-1...8{
                if let block = chessBoard.checkForPiece(position: [i, self.position[1]]){
                    if String(block.prefix(1)) != String(self.name.prefix(1)){
                        positions.append(Coord(x: i, y: self.position[1]))
                        break
                    }
                }else{
                    positions.append(Coord(x: i, y: self.position[1]))
                }
            }
        default:
            positions = [Coord(x:3, y:5),Coord(x:6, y:3)]
        }
        return positions
    }
    
    #if DEBUG
    static let example = Piece(name: "wpawn", id: "wpawn1", position: [1, 2])
    #endif
}
