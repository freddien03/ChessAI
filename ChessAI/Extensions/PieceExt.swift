//
//  PieceExt.swift
//  ChessAI
//
//  Created by Freddie Nunn on 18/11/2021.
//

import Foundation

extension Piece: Equatable {
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.id == rhs.id
    }
}
