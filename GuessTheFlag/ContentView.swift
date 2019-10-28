//
//  ContentView.swift
//
//  Created on 2019/10/24.
//  Copyright © 2019 MidoriISONO. All rights reserved.
//  Day21 Text: https://www.hackingwithswift.com/100/swiftui/21
//  WrapUp: https://www.hackingwithswift.com/books/ios-swiftui/guess-the-flag-wrap-up

import SwiftUI

struct ContentView: View {
//    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
//    var correctAnswer = Int.random(in: 0...2)
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0

    var body: some View {
        ZStack {
//            Color.blue.edgesIgnoringSafeArea(.all)
            /// - Note: Let’s replace the solid blue background color with a linear gradient from blue to black, which ensures that even if a flag has a similar blue stripe it will still stand out against the background.
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
//                        .foregroundColor(.white)
                        /**
                         Let’s make the country name – the part they need to guess – the most prominent piece of text on the screen. We can do that with the font() modifier, which lets us select from one of the built-in font sizes on iOS, but we can add fontWeight() to it to make the text extra bold.
                            - Note: “Large title” is the largest built-in font size iOS offers us, and automatically scales up or down depending on what setting the user has for their fonts – a feature known as Dynamic Type.
                         */
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            /**
                              We’re going to use three here: one to change the shape of flags, one to add a border around the flags, and a third to add a shadow.
                                 1.  __clipShape(Capsule()):__ it looks great for buttons. Making our image capsule shaped is as easy as adding the .clipShape(Capsule()) modifier
                                 2.  __ overlay():__ As for drawing a border around the image, this is done using the overlay() modifier. This lets us draw another view over the flag, which in our case will be a capsule that has a black stroke around its edge.
                                 3. __shadow():__making them really stand out from the background.
                              */
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)

                    }
                }
                Text("Your total score is " + String(totalScore))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)

                Spacer()
            }
        }.alert(isPresented: $showingScore) {
//            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
//                self.askQuestion()
//            })
            /// - Note: This is operation, so we can omit return from swift5.1 :)
            Alert(title: Text(scoreTitle), message: Text("Your score is " + String(totalScore)), dismissButton: .default(  Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    /**
     ## Challenge
     One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:

     1. Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert.
     2. Show the player’s current score in a label directly below the flags.
     3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.

     */
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            totalScore += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            totalScore = totalScore > 1 ? totalScore - 1 : 0
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
