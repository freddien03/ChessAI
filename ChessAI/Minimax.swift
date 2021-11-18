//
//  Minimax.swift
//  ChessAI
//
//  Created by Freddie Nunn on 18/11/2021.
//

import Foundation

class Minimax {
    var chessBoard: ChessBoard
    var depth: Int
    var colour: String
    
    init(chessBoard: ChessBoard, depth: Int, colour: String){
        self.chessBoard = chessBoard
        self.depth = depth
        self.colour = colour
    }
    
    func minimax(chessBoard: ChessBoard, depth: Int, maxTurn: Bool) -> (Int, Coord, Piece){
        var bestMove: Coord = Coord(x: 0, y: 0)
        var bestPiece = Piece(name: "wpawn", id: "wpawn1", position: [1,1])
        if depth == 0{
            print("l")
            return (chessBoard.calculatePointDiff(colour: self.colour), bestMove, bestPiece)
        }
        var val = 0
        if maxTurn{
            val = Int.min
            for piece in chessBoard.pieces{
                for move in piece.calculateMoves(chessBoard: chessBoard){
                    let newBoard = chessBoard.copy()
                    newBoard.pieces[newBoard.pieces.firstIndex(of: piece)!].position = move.pos()
                    let temp = minimax(chessBoard: newBoard, depth: depth-1, maxTurn: false)
                    if temp.0 > val{
                        val = temp.0
                        bestMove = move
                        bestPiece = piece
                    }
                }
            }
        }else{
            val = Int.max
            for piece in chessBoard.pieces{
                for move in piece.calculateMoves(chessBoard: chessBoard){
                    let newBoard = chessBoard.copy()
                    newBoard.pieces[newBoard.pieces.firstIndex(of: piece)!].position = move.pos()
                    let temp = minimax(chessBoard: newBoard, depth: depth-1, maxTurn: true)
                    if temp.0 < val{
                        val = temp.0
                        bestMove = move
                        bestPiece = piece
                    }
                }
            }
        }
        return (val, bestMove, bestPiece)
    }
}
