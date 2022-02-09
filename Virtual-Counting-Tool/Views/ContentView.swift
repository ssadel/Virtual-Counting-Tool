//
//  ContentView.swift
//  Virtual-Counting-Tool
//
//  Created by Sidney Sadel on 2/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAnimation:Bool = true
    @State var animate:Bool = false
    
    var body: some View {
        
        ZStack {
            if showAnimation {
                ZStack {
                    Image("bg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, 30)
                        .frame(width: 200)
                        .scaleEffect(animate ? 50 : 1)
                }.ignoresSafeArea()
                    .animation(.easeInOut(duration: 0.8), value: animate)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            animate.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                                showAnimation.toggle()
                            }
                        }
                    }
            } else {
                MasterView()
            }
        }.animation(.easeInOut, value: showAnimation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
