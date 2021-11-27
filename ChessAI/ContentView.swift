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
        VStack{
            if let game = state.gameOver{
                Text("\(game) WON")
                    .font(.title)
            }
            ZStack {
                state.chessBoard.board
                    .fill(Color.gray)
                    .frame(width: width, height: width)
                    .border(Color.black, width: 1)
                
                ForEach(state.chessBoard.pieces, id: \.self.id) { piece in
                    Button(action: {
                        state.isSelected.toggle()
                        state.pieceSelected = piece
                    }) {
                        Image(piece.name)
                            .resizable()
                            .frame(width: width/8, height: width/8)
                    }
                    .offset(x: (width/2)-(2*(CGFloat(piece.position[0]))-1)*(width/16), y: (width/2)-(2*CGFloat(piece.position[1])-1)*(width/16))
                    .disabled(state.turn != piece.colour)
                }
                
                if state.isSelected{
                    let moves = state.pieceSelected.calculateMoves(chessBoard: state.chessBoard, removeCheck: true)
                    ForEach(moves, id: \.self.id){ pos in
                        ChoiceItem(pos: pos)
                    }
                }
            }
            .padding()
            
            Text(String(state.chessBoard.calculatePointDiff(colour: "w")))
//            Button(action: {
//                state.chessBoard = ChessBoard()
//                state.turn = "w"
//            }){
//                Text("Reset")
//            }
//            .disabled(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
