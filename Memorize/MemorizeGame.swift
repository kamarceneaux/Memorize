//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Kameron Arceneaux on 12/19/23.
//
/*
 This is our a model, in our MVVM diagram.
 */

import Foundation


struct MemoryGame<CardContent> {
    private (set) var cards: Array<Card> //everyone can look at it, but there is a restriction to setting the card.
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            // Must have two cards, because it's a pair
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
}
