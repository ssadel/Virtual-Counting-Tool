//
//  MasterView.swift
//  Virtual-Counting-Tool
//
//  Created by Sidney Sadel on 2/9/22.
//

import SwiftUI

struct MasterView: View {
    
    @AppStorage("isWelcomed") var isWelcomed:Bool = false
    @State var showLoadingView:Bool = true
    
    var body: some View {
        
        VStack {
            if isWelcomed {
                CounterView()
            } else {
                WelcomeView()
            }
        }.animation(.easeInOut(duration: 0.5), value: isWelcomed)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
