//
//  CoordExt.swift
//  ChessAI
//
//  Created by Freddie Nunn on 18/11/2021.
//

import Foundation

extension Coord: Equatable {
    static func == (lhs: Coord, rhs: Coord) -> Bool {
        return lhs.xVal == rhs.xVal && lhs.yVal == rhs.yVal
    }
}
