//
//  StateController.swift
//  ChessAI
//
//  Created by Freddie Nunn on 19/08/2021.
//

import Foundation

class StateController: ObservableObject {
    @Published var turn = "w"
    @Published var chessBoard: ChessBoard = ChessBoard()
    @Published var isSelected = false
    var pieceSelected: Piece = Piece(name: "wpawn", id: "wpawn1", position: [1, 4])
    
    func toggleTurn(){
        if self.turn == "w"{
            self.turn = "b"
        } else{
            self.turn = "w"
        }
    }
    
    func movePiece(pos: Coord){
        var acceptMove = true
        //
        acceptMove = false
        acceptMove = true
        //
        if let piece = self.chessBoard.checkForPiece(position: [pos.xVal, pos.yVal]){
            self.chessBoard.pieces.remove(at: self.chessBoard.pieces.firstIndex(of: piece)!)
        }
        print(chessBoard.isInCheck(colour: turn))
        if turn == "b"{
            print(chessBoard.isInCheck(colour: "w"))
        }else{
            print(chessBoard.isInCheck(colour: "b"))
        }
        if acceptMove == true{
            self.pieceSelected.position = [pos.xVal, pos.yVal]
            self.pieceSelected.hasMoved = true
            self.toggleTurn()
        }
        self.isSelected.toggle()
    }
}
