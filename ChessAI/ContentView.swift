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
//            state.chessBoard.placePieces()
//            ForEach(0..<state.chessBoard.pieces.count, id: \.self) { num in
//                VStack {
//                    if state.chessBoard.pieces1[state.chessBoard.pieces[num]] != [0, 0] {
//                        Button(action: { state.chessBoard.pieces1[state.chessBoard.pieces[num]] = [0, 0] }) {
//                            Image(state.chessBoard.remainingPieces[num])
//                        }
//                        .offset(x: state.chessBoard.calcCoords(num: num)[0], y: state.chessBoard.calcCoords(num: num)[1])
//                    }
//                }
//            }
            ZStack{
            ForEach(state.chessBoard.pieces, id: \.self.id) { piece in
                PieceItem(piece: piece)
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
