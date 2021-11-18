//
//  StateController.swift
//  ChessAI
//
//  Created by Freddie Nunn on 19/08/2021.
//

import Foundation

class StateController: ObservableObject {
    @Published var turn = "w" {
        didSet{
//            if turn == "b"{
//                let best = self.compMove()
//                print(best)
//                self.pieceSelected = best.2
//                movePiece(pos: best.1)
//            }
        }
    }
    @Published var chessBoard: ChessBoard = ChessBoard(pieces: [Piece(name: "wpawn", id: "wpawn1", position: [1, 2]), Piece(name: "wpawn", id: "wpawn2", position: [2, 2]), Piece(name: "wpawn", id: "wpawn3", position: [3, 2]), Piece(name: "wpawn", id: "wpawn4", position: [4, 2]), Piece(name: "wpawn", id: "wpawn5", position: [5, 2]), Piece(name: "wpawn", id: "wpawn6", position: [6, 2]), Piece(name: "wpawn", id: "wpawn7", position: [7, 2]), Piece(name: "wpawn", id: "wpawn8", position: [8, 2]), Piece(name: "bpawn", id: "bpawn1", position: [1, 7]), Piece(name: "bpawn", id: "bpawn2", position: [2, 7]), Piece(name: "bpawn", id: "bpawn3", position: [3, 7]), Piece(name: "bpawn", id: "bpawn4", position: [4, 7]), Piece(name: "bpawn", id: "bpawn5", position: [5, 7]), Piece(name: "bpawn", id: "bpawn6", position: [6, 7]), Piece(name: "bpawn", id: "bpawn7", position: [7, 7]), Piece(name: "bpawn", id: "bpawn8", position: [8, 7]), Piece(name: "wrook", id: "wrook1", position: [1, 1]), Piece(name: "wknight", id: "wknight1", position: [2, 1]), Piece(name: "wbishop", id: "wbishop1", position: [3, 1]), Piece(name: "wqueen", id: "wqueen", position: [5, 1]), Piece(name: "wbishop", id: "wbishop2", position: [6, 1]), Piece(name: "wknight", id: "wknight2", position: [7, 1]), Piece(name: "wrook", id: "wrook2", position: [8, 1]), Piece(name: "brook", id: "brook1", position: [1, 8]), Piece(name: "bknight", id: "bknight1", position: [2, 8]), Piece(name: "bbishop", id: "bbishop1", position: [3, 8]), Piece(name: "bqueen", id: "bqueen", position: [5, 8]), Piece(name: "bbishop", id: "bbishop2", position: [6, 8]), Piece(name: "bknight", id: "bknight2", position: [7, 8]), Piece(name: "brook", id: "brook2", position: [8, 8])])
    @Published var isSelected = false
    var pieceSelected: Piece = Piece(name: "wpawn", id: "wpawn1", position: [1, 4])
    
    func toggleTurn(){
        if self.turn == "w"{
            self.turn = "b"
        } else{
            self.turn = "w"
        }
    }
    
    func compMove() -> (Int, Coord, Piece){
        let minmax = Minimax(chessBoard: self.chessBoard, depth: 2, colour: turn)
        return minmax.minimax(chessBoard: minmax.chessBoard, depth: minmax.depth, maxTurn: true)
    }
    
    func movePiece(pos: Coord){
        var acceptMove = true
        if let piece = self.chessBoard.checkForPiece(position: [pos.xVal, pos.yVal]){
            self.chessBoard.pieces.remove(at: self.chessBoard.pieces.firstIndex(of: piece)!)
        }
        //
        print(chessBoard.isInCheck(colour: turn))
        if turn == "b"{
            print(chessBoard.isInCheck(colour: "w"))
        }else{
            print(chessBoard.isInCheck(colour: "b"))
        }
        //
        if acceptMove == true{
            self.pieceSelected.position = [pos.xVal, pos.yVal]
            if pos.castle.0 == true{
                if pos.castle.1 == 1{
                    if let piece = chessBoard.checkForPiece(position: [8, pos.castle.2]){
                        piece.position = [pos.xVal-1, pos.yVal]
                    }
                }
                if pos.castle.1 == 2{
                    if let piece = chessBoard.checkForPiece(position: [1, pos.castle.2]){
                        piece.position = [pos.xVal+1, pos.yVal]
                    }
                }
            }
            self.pieceSelected.hasMoved = true
            self.toggleTurn()
        }
        self.isSelected.toggle()
    }
}
