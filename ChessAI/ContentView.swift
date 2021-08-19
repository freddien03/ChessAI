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
            state.chessBoard.placePieces()
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
