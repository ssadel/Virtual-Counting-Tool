//
//  WelcomeView.swift
//  Virtual-Counting-Tool
//
//  Created by Sidney Sadel on 2/9/22.
//

import SwiftUI
import AVKit

struct WelcomeView: View {
    
    @AppStorage("isWelcomed") var isWelcomed:Bool = false
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "vid", withExtension: "mp4")!)
    
    var body: some View {
        
        ZStack {
            AVPlayerControllerRepresented(player: player)
                .aspectRatio(contentMode: .fit)
                .frame(width: 950)
                .clipped()
                .ignoresSafeArea()
                .onAppear {
                    player.play()
                    player.isMuted = true
                }
            VStack {
                Spacer()
                Text("Virtual Counting\nTool")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding()
                Text("The minimal pocket sized counting tool.")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding(.bottom, 30)
                Spacer()
                Button {
                    isWelcomed = true
                } label: {
                    Text("Begin")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(4)
                        
                }.buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(.orange)
                    .opacity(0.9)
                    .shadow(radius: 5)
                    .scaleEffect(1.1)

                Spacer()
            }.multilineTextAlignment(.center)
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
