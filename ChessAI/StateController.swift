//
//  StateController.swift
//  ChessAI
//
//  Created by Freddie Nunn on 19/08/2021.
//

import Foundation

class StateController: ObservableObject {
    @Published var chessBoard: ChessBoard = ChessBoard()
}
