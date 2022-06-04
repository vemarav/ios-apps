//
//  ContentView.swift
//  Memorize
//
//  Created by Aravind Vemula on 03/06/22.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFacedUp: Bool = false;
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 25)
            shape.stroke(lineWidth: 3).foregroundColor(.red)
            Text(content).font(.system(size: 40))
            if isFacedUp {
                shape.fill().foregroundColor(.white)
                Text(content).font(.system(size: 40))
            } else {
                shape.fill().foregroundColor(.red)
            }
        }.onTapGesture {
            isFacedUp = !isFacedUp
        }
    }
}

struct ContentView: View {
    @State var emojiCount = 10;
    var emojis = ["✈️","🚗","🚀","🚘","🚙","🚎","🚛","🏎","🛫","🚕","🚚","🚐","⛴","🚝","🚍","🏍","🛳","🚟","🚖","🚓","🛩","🛵","🚲","🛴","🚋","🚌","🚁","🚑","🚜","🛺","🚒","🚊","🛻","🚆","🚂","🚞","🚃","🚡","🚈","🚤","🚄","🚠","⛽️","⛵️","🚇","🚢","🛥","🚉","🚅","🛬","🚔"]
    
    
    var remove: some View {
        Button(
            action: { if emojiCount > 1 { emojiCount -= 1 }},
            label: { Image(systemName: "minus.circle") }
        )
    }
    
    var add: some View {
        Button(
            action: { if emojiCount < emojis.count { emojiCount += 1 }},
            label: { Image(systemName: "plus.circle") }
        )
    }
    
    var body: some View {
        let gridItem = GridItem(.adaptive(minimum: 100))
        VStack {
            ScrollView {
                LazyVGrid(columns: [gridItem]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                    }
                }.padding()
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
