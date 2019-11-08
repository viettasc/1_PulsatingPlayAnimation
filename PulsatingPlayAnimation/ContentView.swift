//
//  ContentView.swift
//  PulsatingPlayAnimation
//
//  Created by Viettasc on 11/7/19.
//  Copyright © 2019 Viettasc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAnimated = false
    fileprivate var width: CGFloat {
        return isAnimated ? 60 : 0
    }
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black,.blue]), center: .center, startRadius: 5, endRadius: 500)
                .scaleEffect(1.2)
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .scaleEffect(isAnimated ? 2 : 1)
                .hueRotation(.degrees(isAnimated ? 360 : 0))
                .opacity(isAnimated ? 0 : 1)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false).speed(1))
                .onAppear {
                    self.isAnimated.toggle()
            }
            Image(systemName: "play.fill")
                .resizable()
                .frame(width: width, height: width)
                .foregroundColor(.white)
                .padding(isAnimated ? 50 : 0)
                .background(Circle().foregroundColor(.blue))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(1))
        }
        .shadow(radius: 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
