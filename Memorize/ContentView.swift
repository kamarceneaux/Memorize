//
//  ContentView.swift
//  Memorize
//
//  Created by Kameron Arceneaux on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]

    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        // Implicit return
        // Makes a grid!
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let content: String // remember this cant be changed
    @State var isFaceUp = true //an example of a default value for a parameter
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) //constant
            Group {
                base
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0: 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
