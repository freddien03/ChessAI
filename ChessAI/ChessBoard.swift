//
//  ChessBoard.swift
//  ChessAI
//
//  Created by Freddie Nunn on 15/08/2021.
//

import Foundation
import SwiftUI

class ChessBoard: ObservableObject {
    let width = UIScreen.main.bounds.width
    let board = Board(rows: 8, columns: 8)
//    var pieces1 = [
//        ["bpawn1", [1, 7]],
//        ["bpawn2", [2, 7]],
//        ["bpawn3", [3, 7]],
//        ["bpawn4", [4, 7]],
//        ["bpawn5", [5, 7]],
//        ["bpawn6", [6, 7]],
//        ["bpawn7", [7, 7]],
//        ["bpawn8", [8, 7]],
//        ["wpawn1", [1, 2]],
//        ["wpawn2", [2, 2]],
//        ["wpawn3", [3, 2]],
//        ["wpawn4", [4, 2]],
//        ["wpawn5", [5, 2]],
//        ["wpawn6", [6, 2]],
//        ["wpawn7", [7, 2]],
//        ["wpawn8", [8, 2]],
//        ["brook1", [1, 8]],
//        ["bknight1", [2, 8]],
//        ["bbishop1", [3, 8]],
//        ["bqueen1", [4, 8]],
//        ["bking1", [5, 8]],
//        ["bbishop2", [6, 8]],
//        ["bknight2", [7, 8]],
//        ["brook2", [8, 8]],
//        ["wrook1", [1, 1]],
//        ["wknight1", [2, 1]],
//        ["wbishop1", [3, 1]],
//        ["wqueen1", [4, 1]],
//        ["wking1", [5, 1]],
//        ["wbishop2", [6, 1]],
//        ["wknight2", [7, 1]],
//        ["wrook2", [8, 1]]
//    ]
    

    var pieces: [Piece] = [Piece(name: "wpawn", id: "wpawn1", position: [1, 2]), Piece(name: "wpawn", id: "wpawn2", position: [2, 2]), Piece(name: "wpawn", id: "wpawn3", position: [3, 2]), Piece(name: "wpawn", id: "wpawn4", position: [4, 2]), Piece(name: "wpawn", id: "wpawn5", position: [5, 2]), Piece(name: "wpawn", id: "wpawn6", position: [6, 2]), Piece(name: "wpawn", id: "wpawn7", position: [7, 2]), Piece(name: "wpawn", id: "wpawn8", position: [8, 2]), Piece(name: "bpawn", id: "bpawn1", position: [1, 7]), Piece(name: "bpawn", id: "bpawn2", position: [2, 7]), Piece(name: "bpawn", id: "bpawn3", position: [3, 7]), Piece(name: "bpawn", id: "bpawn4", position: [4, 7]), Piece(name: "bpawn", id: "bpawn5", position: [5, 7]), Piece(name: "bpawn", id: "bpawn6", position: [6, 7]), Piece(name: "bpawn", id: "bpawn7", position: [7, 7]), Piece(name: "bpawn", id: "bpawn8", position: [8, 7]), Piece(name: "wrook", id: "wrook1", position: [1, 1]), Piece(name: "wknight", id: "wknight1", position: [2, 1]), Piece(name: "wbishop", id: "wbishop1", position: [3, 1]), Piece(name: "wqueen", id: "wqueen", position: [4, 1]), Piece(name: "wking", id: "wking", position: [5, 1]), Piece(name: "wbishop", id: "wbishop2", position: [6, 1]), Piece(name: "wknight", id: "wknight2", position: [7, 1]), Piece(name: "wrook", id: "wrook2", position: [8, 1]), Piece(name: "brook", id: "brook1", position: [1, 8]), Piece(name: "bknight", id: "bknight1", position: [2, 8]), Piece(name: "bbishop", id: "bbishop1", position: [3, 8]), Piece(name: "bqueen", id: "bqueen", position: [4, 8]), Piece(name: "bking", id: "bking", position: [5, 8]), Piece(name: "bbishop", id: "bbishop2", position: [6, 8]), Piece(name: "bknight", id: "bknight2", position: [7, 8]), Piece(name: "brook", id: "brook2", position: [8, 8])]
    
//    func placePieces() -> some View{
//        ZStack {
//            ForEach(0..<pieces.count, id: \.self) { [self] num in
//                if pieces1[pieces[num]] != [0, 0] {
//                    Button(action: { clicked(num: num) }) {
//                        Image(remainingPieces[num])
//                    }
//                        .offset(x: calcCoords(num: num)[0], y: calcCoords(num: num)[1])
//                }
//            }
//        }
//    }
    
    
}
