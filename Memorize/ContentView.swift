//
//  ContentView.swift
//  Memorize
//
//  Created by Kameron Arceneaux on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["👻", "🎃", "🕷️", "😈", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭", "👻", "🕸️", "🎃"]
    let cardCount: Int = 16
    
    let halloween = ["👻", "🎃", "🕷️", "😈", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭", "👻", "🕸️", "🎃"]
    let sports = ["🎱", "🏓", "🏈", "🥎", "🏏", "🏈", "⚽️", "🎱", "🥎", "🏓", "⚾️", "⚾️", "🏐", "🏏", "⚽️", "🏐"]
    let nature = ["🌞", "🌺", "🌈", "🌼", "🍃", "🌸", "🌞", "🌺", "🌧", "🌼", "🍃", "🌸", "🌞", "🌧", "🍃", "🌈"]

    
    
    var body: some View {
        VStack{
            title
            ScrollView {
                cards
            }
            Spacer()
            themeChangers
            
        }
        .padding()
    }
    
    var title: some View {
        HStack {
            Text("Memorize!")
                .font(.largeTitle)
        }
    }
    
    var cards: some View {
        // Implicit return
        // Makes a grid!
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var themeChangers: some View {
        HStack(alignment: .center) {
            theme1BTN
            theme2BTN
            theme3BTN
        }

    }
    
    func changeTheme(newTheme: [String], symbol: String, themeName: String) -> some View {
        VStack{
            Button(action: {
                emojis = newTheme.shuffled()
            }, label: {
                Image(systemName: symbol)
            })
                .imageScale(.large)
                .font(.largeTitle)
            Text(themeName)
                .font(.caption)
        }
    }
    
    var theme1BTN: some View {
        changeTheme(newTheme: halloween, symbol: "h.square.fill", themeName: "Halloween")
    }
    
    var theme2BTN: some View {
        changeTheme(newTheme: sports, symbol: "soccerball", themeName: "Sports")
    }
    
    var theme3BTN: some View {
        changeTheme(newTheme: nature, symbol: "tree.fill", themeName: "Nature")
    }
}

struct CardView: View {
    let content: String // remember this cant be changed
    @State var isFaceUp = false //an example of a default value for a parameter
    
    
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
