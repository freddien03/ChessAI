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
    let colour: String
    let id = UUID()
    var hasMoved = false
    @Published var position: [Int]
    
    init(name: String, id: String, position: [Int]) {
        self.name = name
        self.type = self.name
        self.type.removeFirst()
        self.colour = String(self.name.prefix(1))
//        self.id = id
        self.position = position
    }
    
    
    func calculateMoves(chessBoard: ChessBoard) -> [Coord] {
        var positions: [Coord] = []
        switch self.type{
        case "pawn":
            var inc = 0
            if colour == "w"{
                inc = 1
            }else{
                inc = -1
            }
            for i in 0...2 {
                if let piece = chessBoard.checkForPiece(position: [self.position[0]-1+i, self.position[1]+inc]){
                    if piece.colour != self.colour{
                        if i%2 == 0{
                            positions.append(Coord(x: self.position[0]-1+i, y: self.position[1]+inc))
                        }
                    }
                }else{
                    if i%2 != 0{
                        positions.append(Coord(x: self.position[0]-1+i, y: self.position[1]+inc))
                    }
                }
            }
            if self.hasMoved == false{
                if chessBoard.checkForPiece(position: [self.position[0], self.position[1]+2*inc]) == nil{
                    positions.append(Coord(x: self.position[0], y: self.position[1]+2*inc))
                }
            }
        
        case "king":
            if !hasMoved{
                var yPos = 1
                if colour == "b"{
                    yPos = 8
                }
                if let piece = chessBoard.checkForPiece(position: [8,yPos]){
                    if chessBoard.checkForPiece(position: [7,yPos]) == nil || chessBoard.checkForPiece(position: [6,yPos])  == nil{
                        if !piece.hasMoved {
                            let temp = Coord(x: self.position[0]+2, y: yPos)
                            temp.castle = (true, 1, yPos)
                            positions.append(temp)
                        }
                    }
                }
                if let piece = chessBoard.checkForPiece(position: [1, yPos]){
                    if chessBoard.checkForPiece(position: [2,yPos]) == nil || chessBoard.checkForPiece(position: [3,yPos])  == nil{
                        if !piece.hasMoved {
                            let temp = Coord(x: self.position[0]-2, y: yPos)
                            temp.castle = (true, 2, yPos)
                            positions.append(temp)
                        }
                    }
                }
            }

            for i in -1...1 {
                for j in -1...1{
                    if let piece = chessBoard.checkForPiece(position: [self.position[0]+i, self.position[1]+j]){
                        if piece.colour != self.colour{
                            positions.append(Coord(x: self.position[0]+i, y: self.position[1]+j))
                        }
                    } else {
                        positions.append(Coord(x: self.position[0]+i, y: self.position[1]+j))
                    }
                }
            }

        case "rook":
            positions = chessBoard.possStraightMoves(position: self.position, colour: self.colour)
        
        case "bishop":
            positions = chessBoard.possDiagMoves(position: self.position, colour: self.colour)
        
        case "queen":
            positions = chessBoard.possStraightMoves(position: self.position, colour: self.colour) + chessBoard.possDiagMoves(position: self.position, colour: self.colour)
        
        case "knight":
            for i in -1...1{
                for j in -1...1{
                    if i != 0 && j != 0{
                        if let piece = chessBoard.checkForPiece(position: [self.position[0]+(2*i), self.position[1]+j]){
                            if piece.colour != self.colour{
                                positions.append(Coord(x: self.position[0]+(2*i), y: self.position[1]+j))
                            }
                        } else {
                            positions.append(Coord(x: self.position[0]+(2*i), y: self.position[1]+j))
                        }
                        if let piece = chessBoard.checkForPiece(position: [self.position[0]+j, self.position[1]+(2*i)]){
                            if piece.colour != self.colour{
                                positions.append(Coord(x: self.position[0]+j, y: self.position[1]+(i*2)))
                            }
                        } else {
                            positions.append(Coord(x: self.position[0]+j, y: self.position[1]+(i*2)))
                        }
                    }
                }
            }
        default:
            positions = [Coord(x:3, y:5),Coord(x:6, y:3)]
        }
        var newPositions: [Coord] = []
        for position in positions{
            if position.xVal > 0 && position.xVal <= 8 && position.yVal > 0 && position.yVal <= 8{
                if let piece = chessBoard.checkForPiece(position: [position.xVal, position.yVal]){
                    newPositions.append(position)
//                    if piece.type != "king"{
//                        newPositions.append(position)
//                    }
                } else{
                    newPositions.append(position)
                }
            }
        }
        return newPositions
    }
    
    #if DEBUG
    static let example = Piece(name: "wpawn", id: "wpawn1", position: [1, 2])
    #endif
}
