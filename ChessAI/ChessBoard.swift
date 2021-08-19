//
//  ChessBoard.swift
//  ChessAI
//
//  Created by Freddie Nunn on 15/08/2021.
//

import Foundation
import SwiftUI

class ChessBoard {
    let width = UIScreen.main.bounds.width
    let board = Board(rows: 8, columns: 8)
    var remainingPieces: [String] = ["bpawn", "bpawn", "bpawn", "bpawn", "bpawn", "bpawn", "bpawn", "bpawn", "wpawn", "wpawn", "wpawn", "wpawn", "wpawn", "wpawn", "wpawn", "wpawn", "brook", "bknight", "bbishop", "bqueen", "bking", "bbishop", "bknight", "brook", "wrook", "wknight", "wbishop", "wqueen", "wking", "wbishop", "wknight", "wrook"]
    var remainingPositions: [[Int]] = [[1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7], [8, 7], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2], [8, 2], [1, 8], [2, 8], [3, 8], [4, 8], [5, 8], [6, 8], [7, 8], [8, 8], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1]]
    
    func placePieces() -> some View{
        ForEach(0..<remainingPositions.count, id: \.self) { num  in
            ZStack{
                Button(action: { self.clicked(num: num) }) {
                    Image(self.remainingPieces[num])
                }
                    .offset(x: (self.width/2)-(2*(9-CGFloat(self.remainingPositions[num][0]))-1)*(self.width/16), y: (self.width/2)-(2*CGFloat(self.remainingPositions[num][1])-1)*(self.width/16))
            }
        }
    }
    
    func clicked(num: Int) {
        print(remainingPieces[num])
        remainingPieces.remove(at: num)
        remainingPositions.remove(at: num)
        print(remainingPieces)
    }
    
}
