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

    var pieces: [Piece] = [Piece(name: "wpawn", id: "wpawn1", position: [1, 2]), Piece(name: "wpawn", id: "wpawn2", position: [2, 2]), Piece(name: "wpawn", id: "wpawn3", position: [3, 2]), Piece(name: "wpawn", id: "wpawn4", position: [4, 2]), Piece(name: "wpawn", id: "wpawn5", position: [5, 2]), Piece(name: "wpawn", id: "wpawn6", position: [6, 2]), Piece(name: "wpawn", id: "wpawn7", position: [7, 2]), Piece(name: "wpawn", id: "wpawn8", position: [8, 2]), Piece(name: "bpawn", id: "bpawn1", position: [1, 7]), Piece(name: "bpawn", id: "bpawn2", position: [2, 7]), Piece(name: "bpawn", id: "bpawn3", position: [3, 7]), Piece(name: "bpawn", id: "bpawn4", position: [4, 7]), Piece(name: "bpawn", id: "bpawn5", position: [5, 7]), Piece(name: "bpawn", id: "bpawn6", position: [6, 7]), Piece(name: "bpawn", id: "bpawn7", position: [7, 7]), Piece(name: "bpawn", id: "bpawn8", position: [8, 7]), Piece(name: "wrook", id: "wrook1", position: [1, 1]), Piece(name: "wknight", id: "wknight1", position: [2, 1]), Piece(name: "wbishop", id: "wbishop1", position: [3, 1]), Piece(name: "wqueen", id: "wqueen", position: [5, 1]), Piece(name: "wbishop", id: "wbishop2", position: [6, 1]), Piece(name: "wknight", id: "wknight2", position: [7, 1]), Piece(name: "wrook", id: "wrook2", position: [8, 1]), Piece(name: "brook", id: "brook1", position: [1, 8]), Piece(name: "bknight", id: "bknight1", position: [2, 8]), Piece(name: "bbishop", id: "bbishop1", position: [3, 8]), Piece(name: "bqueen", id: "bqueen", position: [5, 8]), Piece(name: "bbishop", id: "bbishop2", position: [6, 8]), Piece(name: "bknight", id: "bknight2", position: [7, 8]), Piece(name: "brook", id: "brook2", position: [8, 8])]
    
    init() {
        pieces.append(wKing)
        pieces.append(bKing)
    }
    func checkForPiece(position: [Int]) -> Piece?{
        for piece in self.pieces{
            if piece.position == position{
                return piece
            }
        }
        return nil
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
}
