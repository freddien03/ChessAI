//
//  PieceItem.swift
//  ChessAI
//
//  Created by Freddie Nunn on 30/08/2021.
//

import SwiftUI

struct PieceItem: View {
    @EnvironmentObject var state: StateController
    let width = UIScreen.main.bounds.width
    @ObservedObject var piece: Piece
    var body: some View {
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
}

struct PieceItem_Previews: PreviewProvider {
    static var previews: some View {
        PieceItem(piece: Piece.example)
    }
}
