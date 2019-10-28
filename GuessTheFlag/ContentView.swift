//
//  ContentView.swift
//
//  Created on 2019/10/24.
//  Copyright © 2019 MidoriISONO. All rights reserved.
//  Day21 Text: https://www.hackingwithswift.com/100/swiftui/21

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    /// - Note: The Int.random(in:) method automatically picks a random number.
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        /**
         The renderingMode(.original) modifier tells SwiftUI to render the original image pixels rather than trying to recolor them as a button.

         And now we have a problem: our body property is trying to send back two views, a VStack and a ForEach, but that isn’t allowed. This is where our second VStack will come in: I’d like you to wrap the original VStack and the ForEach below in a new VStack, this time with a spacing of 30 points.
         */
        VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                Text(countries[correctAnswer])
            }
            ForEach(0 ..< 3) { number in
                Button(action: {
                    // flag was tapped
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original)
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
