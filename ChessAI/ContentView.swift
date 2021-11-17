//
//  ContentView.swift
//  ChessAI
//
//  Created by Freddie Nunn on 15/08/2021.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var state: StateController
    let width = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            state.chessBoard.board
                .fill(Color.gray)
                .frame(width: width, height: width)
                .border(Color.black, width: 1)
            
            ForEach(state.chessBoard.pieces, id: \.self.id) { piece in
                PieceItem(piece: piece)
            }
            
            if state.isSelected{
                let moves = state.pieceSelected.calculateMoves(chessBoard: state.chessBoard)
                ForEach(moves, id: \.self.id){ pos in
                    ChoiceItem(pos: pos)
                }
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
