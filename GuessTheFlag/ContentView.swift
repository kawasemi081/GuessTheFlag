//
//  ContentView.swift
//
//  Created on 2019/10/24.
//  Copyright © 2019 MidoriISONO. All rights reserved.
//  Day21 Text: https://www.hackingwithswift.com/100/swiftui/21
//  WrapUp: https://www.hackingwithswift.com/books/ios-swiftui/guess-the-flag-wrap-up

import SwiftUI

/**
# Challenge on Day34

Go back to the Guess the Flag project and add some animation:
- When you tap the correct flag, make it spin around 360 degrees on the Y axis.
- Make the other two buttons fade out to 25% opacity.
- And if you tap on the wrong flag? Well, that’s down to you – get creative!

- SeeAlso: https://www.hackingwithswift.com/books/ios-swiftui/animation-wrap-up
*/
struct ContentView: View {

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0

    @State private var animationAmount = 0.0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)

                        print("test: \(number)")
                        withAnimation {
                            if number == self.correctAnswer {
                                self.animationAmount += 360
                                self.animationAmount += 360
                            }
                        }
                    }) {
                        FlagImage(country: self.countries[number])
                    }
                    .rotation3DEffect(.degrees(self.animationAmount), axis: (x: 0, y: 1, z: 0))

                }
                Text("Your total score is " + String(totalScore))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)

                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is " + String(totalScore)), dismissButton: .default(  Text("Continue")) {
                self.askQuestion()
            })        }
    }

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

struct FlagImage: View {
    var country: String
    var body: some View {
        Image(country)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}

struct CorrectButton: View {
    var country: String
    var body: some View {
        Image(country)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}
struct WrongButton: View {
    var country: String
    var body: some View {
        Image(country)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}

