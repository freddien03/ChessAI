//
//  Coord.swift
//  ChessAI
//
//  Created by Freddie Nunn on 16/11/2021.
//

import Foundation

class Coord: ObservableObject {
    let xVal: Int
    let yVal: Int
    let id = UUID()
    var castle: (Bool, Int, Int) = (false, 0, 0)
    
    init(x: Int, y: Int) {
        xVal = x
        yVal = y
    }
    
    func pos() -> [Int]  {
        return [xVal, yVal]
    }
}
