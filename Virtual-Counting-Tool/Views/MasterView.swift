//
//  MasterView.swift
//  Virtual-Counting-Tool
//
//  Created by Sidney Sadel on 2/9/22.
//

import SwiftUI

struct MasterView: View {
    
    @AppStorage("isWelcomed") var isWelcomed:Bool = false
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
