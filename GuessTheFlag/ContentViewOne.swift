//
//  ContentView.swift
//  GuessTheFlag
//
//  Created on 2019/10/24.
//  Copyright © 2019 misono. All rights reserved.
//  Day20 Text: https://www.hackingwithswift.com/100/swiftui/20

import SwiftUI

struct ContentViewOne: View {
    /// - Note: we create some state that tracks whether our alert is showing
    @State private var showingAlert = false
    var body: some View {
        /**
         A basic SwiftUI alert has a title, message, and one dismiss button.
         ```
         Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
         ```
         - Note: More interesting is how we present that alert.
            That attaches the alert to the button, but honestly it doesn’t matter where the alert() modifier is used – all we’re doing is saying that an alert exists and is shown when showingAlert is true.
         */
        Button("Show Alert") {
            self.showingAlert = true
        }.alert(isPresented: $showingAlert) {
            /// - Attention: This’s another two-way data binding, and it’s here because SwiftUI will automatically set showingAlert back to false when the alert is dismissed.
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }


        /**
        VStack – a vertical stack of views – the two text views would be placed one above the other.
         - Note: Just like SwiftUI’s other views, VStack can have a maximum of 10 children – if you want to add more, you should wrap them inside a Group.
         */
//        VStack {
//            Text("Hello World")
//            Text("This is inside a stack")
//        }
        /// - Note: By default VStack places little or no spacing between the two views, but we can control the spacing by providing a parameter when we create the stack
//        VStack(spacing: 20) {
//            Text("Hello World")
//            Text("This is inside a stack")
//        }
        /// - Note: By default, VStack aligns its views so they are centered, but you can control that with its alignment property. For example, this aligns the text views to their leading edge, which in a left-to-right language such as English will cause them to be aligned to the left.
//        VStack(alignment: .leading) {
//            Text("Hello World")
//            Text("This is inside a stack")
//        }
        /**
         HStack for arranging things horizontally
        - Note: This has the same syntax as VStack, including the ability to add spacing and alignment
         */
//        HStack(spacing: 20) {
//            Text("Hello World")
//            Text("This is inside a stack")
//        }
        /**
         You can use one or more Spacer views to push the contents of your stack to one side.
        - Note: These automatically take up all remaining space, so if you add one at the end a VStack it will push all your views to the top of the screen
         */
//        VStack {
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Spacer()
//        }
        /**
         ZStack for arranging things by depth.
         ZStack doesn’t have the concept of spacing because the views overlap, but it does have alignment.
        - Note: It makes views that overlap. In the case of our two text views, this will make things rather hard to read.
         */
//        ZStack {
//            Text("Hello World")
//            Text("This is inside a stack")
//        }
        /// - Note: ZStack draws its contents from top to bottom, back to front. This means if you have an image then some text ZStack will draw them in that order, placing the text on top of the image.
//         ZStack(alignment: .top) {
//            Image("logo")
//            Text("Hello World")
//        }
//        ZStack {
//            Text("Your content")
//        }
        /**
        If we want to put something behind the text, we need to place it above it in the ZStack. But what if we wanted to put some red behind there – how would we do that?
         - Note:  One option is to use the background() modifier.
         The result is only the text view had a background color, even though we’ve asked the whole ZStack to have it.
         In fact, there’s no difference between that code and this:
         ```
         ZStack {
             Text("Your content")
                 .background(Color.red)
         }
         ```
         */
//        ZStack {
//            Text("Your content")
//        }
//        .background(Color.red)
        /// - Note: If you want to fill in red the whole area behind the text, you should place the color into the ZStack.
//        ZStack {
//            Color.red
//            Text("Your content")
//        }
        /**
        Color.red is a view in its own right, which is why it can be used like shapes and text.
        - Note: It automatically takes up all the space available, but you can also use the __frame()__ modifier to ask for specific sizes
         */
//        ZStack {
//            Color.red.frame(width: 200, height: 200)
//            Text("Your content")
//        }
        /**
          We also have some semantic colors: colors that don’t say what hue they contain, but instead describe their purpose.
          - Note: For example, Color.primary is the default color of text in SwiftUI, and will be either black or white depending on whether the user’s device is running in light mode or dark mode. There’s also Color.secondary, which is also black or white depending on the device, but now has slight transparency so that a little of the color behind it shines through.
         */
//        ZStack {
            /// - Note: If you need something specific..
//            Color(red: 0.5, green: 0, blue: 0.8)//.frame(width: 200, height: 200)
            /**
                If you want your content to go under the safe area, you can use the edgesIgnoringSafeArea() modifier to specify which screen edges you want to run up to.
                For example, this creates a ZStack which fills the screen edge to edge with violet then draws some text on top
             */
//            Color(red: 0.5, green: 0, blue: 0.8).edgesIgnoringSafeArea(.all)
            /**
             SwiftUI gives us three kinds of gradients to work with, and like colors they are also views that can be drawn in our UI.
             Gradients are made up of several components:
               1. An array of colors to show
               2. Size and direction information
               3. The type of gradient to use
            - Note: For example, a linear gradient goes in one direction, so we provide it with a start and end point
             */
//            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

            /**
            The inner Gradient type used there can also be provided with gradient stops, which let you specify both a color and how far along the gradient the color should be used.
             - Note: Radial gradients move outward in a circle shape, so instead of specifying a direction we specify a start and end radius – how far from the center of the circle the color should start and stop changing.
             */
//            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            /**
             The last gradient type is called an angular gradient, although you might have heard it referred to elsewhere as a conic or conical gradient. This cycles colors around a circle rather than radiating outward, and can create some beautiful effects.

             - Note: For example, this cycles through a range of colors in a single gradient, centered on the middle of the gradient.
             */
//            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//            Text("Your content")
//        }
        /**
        Buttons in SwiftUI can be made in two ways depending on how they should look.
         - Note: The simplest way to make a button is when it just contains some text
         */
//        Button("Tap me!") {
//            print("Button was tapped")
//        }
        /// - Note: If you want something more, such as an image or a combination of views. This is particularly common when you want to incorporate images into your buttons.
//        Button(action: {
//            print("Button was tapped")
//        }) {
//            Text("Tap me!")
//        }
        /**
         SwiftUI has a dedicated Image type for handling pictures in your apps, and there are three main ways you will create them:

         - __Image("pencil")__: will load an image called “Pencil” that you have added to your project.
         - __mage(decorative: "pencil")__: will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
         - __Image(systemName: "pencil")__: will load the pencil icon that is built into iOS. This uses Apple’s SF Symbols icon collection, and you can search for icons you like – download Apple’s free SF Symbols app from the web to see the full set.
        - Note: If they don’t actually add information that isn’t already elsewhere on the screen, use the Image(decorative:) initializer.
         */
        /// - Note: Because the longer form of buttons can have any kind of views inside them, you can use images like this.
//        Button(action: {
//            print("Edit button was tapped")
//        }) {
//            Image(systemName: "pencil")
//        }
        /// - Note: And of course you can combine these with stacks to make more advanced button layouts.
//        Button(action: {
//            print("Edit button was tapped")
//        }) {
//            HStack(spacing: 10) {
//                /// - Note: Use the renderingMode(.original) modifier to force SwiftUI to show the original image rather than the recolored version.
//                Image(systemName: "pencil").renderingMode(.original)
//                Text("Edit")
//            }
//        }
    }
}

struct ContentViewOne_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOne()
    }
}
