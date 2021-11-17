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
    
    init(x: Int, y: Int) {
        xVal = x
        yVal = y
    }
}
