//
//  ChoiceItem.swift
//  ChessAI
//
//  Created by Freddie Nunn on 16/11/2021.
//

import SwiftUI

struct ChoiceItem: View {
    let width = UIScreen.main.bounds.width
    @EnvironmentObject var state: StateController
    @ObservedObject var pos: Coord
    var body: some View {
        Button(action: {
            state.movePiece(pos: pos)
        }){
            Image(systemName: "circle.fill")
        }
        .accentColor(.red)
        .offset(x: (width/2)-(2*(CGFloat(pos.xVal))-1)*(width/16), y: (width/2)-(2*CGFloat(pos.yVal)-1)*(width/16))
    }
}

struct ChoiceItem_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceItem(pos: Coord(x: 3, y: 5))
    }
}
