//
//  ChessBoard.swift
//  ChessAI
//
//  Created by Freddie Nunn on 15/08/2021.
//

import Foundation
import SwiftUI

class ChessBoard: ObservableObject {
    let board = Board(rows: 8, columns: 8)
    let wKing = Piece(name: "wking", id: "wking", position: [4, 1])
    let bKing = Piece(name: "bking", id: "bking", position: [4, 8])

    var pieces: [Piece]
    
    init(pieces: [Piece]) {
        self.pieces = pieces
        self.pieces.append(wKing)
        self.pieces.append(bKing)
    }
    func checkForPiece(position: [Int]) -> Piece?{
        for piece in self.pieces{
            if piece.position == position{
                return piece
            }
        }
        return nil
    }
    
    func copy() -> ChessBoard {
        return ChessBoard(pieces: self.pieces)
    }
    
    func possStraightMoves(position: [Int], colour: String) -> [Coord]{
        var horizPos = [Coord]()
        var vertPos = [Coord]()
        var horizEnd = false
        var vertEnd = false
        for i in 0...8{
            if i < position[0]{
                if let piece = self.checkForPiece(position: [i, position[1]]){
                    horizPos = []
                    if piece.colour != colour{
                        horizPos.append(Coord(x: i, y: position[1]))
                    }
                } else {
                    horizPos.append(Coord(x: i, y: position[1]))
                }
            }
            if i > position[0]{
                if horizEnd == false{
                    if let piece = self.checkForPiece(position: [i, position[1]]){
                        horizEnd = true
                        if piece.colour != colour{
                            horizPos.append(Coord(x: i, y: position[1]))
                        }
                    } else {
                        horizPos.append(Coord(x: i, y: position[1]))
                    }
                }
            }
            if i < position[1]{
                if let piece = self.checkForPiece(position: [position[0], i]){
                    vertPos = []
                    if piece.colour != colour{
                        vertPos.append(Coord(x: position[0], y: i))
                    }
                } else {
                    vertPos.append(Coord(x: position[0], y: i))
                }
            }
            if i > position[1]{
                if vertEnd == false{
                    if let piece = self.checkForPiece(position: [position[0], i]){
                        vertEnd = true
                        if piece.colour != colour{
                            vertPos.append(Coord(x: position[0], y: i))
                        }
                    } else {
                        vertPos.append(Coord(x: position[0], y: i))
                    }
                }
            }
        }
        return horizPos+vertPos
    }
    
    func possDiagMoves(position: [Int], colour: String) -> [Coord]{
        var horizPos = [Coord]()
        var vertPos = [Coord]()
        var horizEnd = false
        var vertEnd = false
        for i in -8...8{
            if i < 0{
                if let piece = self.checkForPiece(position: [position[0]+i, position[1]+i]){
                    horizPos = []
                    if piece.colour != colour{
                        horizPos.append(Coord(x: position[0]+i, y: position[1]+i))
                    }
                } else {
                    horizPos.append(Coord(x: position[0]+i, y: position[1]+i))
                }
                
                if let piece = self.checkForPiece(position: [position[0]+i, position[1]-i]){
                    vertPos = []
                    if piece.colour != colour{
                        vertPos.append(Coord(x: position[0]+i, y: position[1]-i))
                    }
                } else {
                    vertPos.append(Coord(x: position[0]+i, y: position[1]-i))
                }
            }
            if i > 0{
                if horizEnd == false{
                    if let piece = self.checkForPiece(position: [position[0]+i, position[1]+i]){
                        horizEnd = true
                        if piece.colour != colour{
                            horizPos.append(Coord(x: position[0]+i, y: position[1]+i))
                        }
                    } else {
                        horizPos.append(Coord(x: position[0]+i, y: position[1]+i))
                    }
                }
                
                if vertEnd == false{
                    if let piece = self.checkForPiece(position: [position[0]+i, position[1]-i]){
                        vertEnd = true
                        if piece.colour != colour{
                            vertPos.append(Coord(x: position[0]+i, y: position[1]-i))
                        }
                    } else {
                        vertPos.append(Coord(x: position[0]+i, y: position[1]-i))
                    }
                }
            }
        }
        return horizPos+vertPos
    }
    
    func isInCheck(colour: String) -> String {
        var king = wKing
        if colour == "b"{
            king = bKing
        }
        var check = false
        var mate = false
        for piece in self.pieces{
            if piece.colour != king.colour{
                for position in piece.calculateMoves(chessBoard: self){
                    if [position.xVal, position.yVal] == king.position{
                        check = true
                        mate = true
                    }
                }
            } else {
                
            }
        }
        if king.calculateMoves(chessBoard: self) != []{
            mate = false
        }
        if mate == true{
            return "mate"
        }else if check == true{
            return "check"
        }else{
            return "none"
        }
    }
    
    func calculatePointDiff(colour: String)-> Int{
        var points = 0
        var sign = -1
        for piece in self.pieces{
            if piece.colour == colour{
                sign = 1
            }else{
                sign = -1
            }
            switch piece.type{
            case "pawn":
                points += 1*sign
            case "bishop":
                points += 3*sign
            case "knight":
                points += 3*sign
            case "rook":
                points += 5*sign
            case "queen":
                points += 9*sign
            default:
                points += 0
            }
        }
        return points
    }
}
