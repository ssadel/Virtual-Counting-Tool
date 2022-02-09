//
//  CounterView.swift
//  Virtual-Counting-Tool
//
//  Created by Sidney Sadel on 2/9/22.
//

import SwiftUI

struct CounterView: View {
    
    @State private var value:Int = 99999
    @State private var scaleValue:Double = 3
    
    @State private var showMenuItem1:Bool = false
    @State private var showMenuItem2:Bool = false
    @State private var showMenuItem3:Bool = false
    
    @AppStorage("isWelcomed") var isWelcomed:Bool = false
    
    @State private var showSheet:Bool = false
    
    var body: some View {
        
        GeometryReader { g in
            ZStack {
                LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        
                        Button {
                            self.showMenu()
                        } label: {
                            Image(systemName: "gear.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .shadow(radius: 1)
                                .padding()
                        }
                        
                        if showMenuItem1 {
                            Button {
                                isWelcomed = false
                            } label: {
                                Image(systemName: "house.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .shadow(radius: 1)
                            }.transition(.move(edge: .leading).combined(with: .opacity))
                            
                        }
                        if showMenuItem2 {
                            Button {
                                showSheet = true
                            } label: {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .shadow(radius: 1)
                            }.transition(.move(edge: .leading).combined(with: .opacity))
                                .sheet(isPresented: $showSheet) {
                                    showSheet = false
                                } content: {
                                    SheetView(isActive: $showSheet, value: $value)
                                }

                        }
                        if showMenuItem3 {
                            Button {
                                value = 0
                            } label: {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .shadow(radius: 1)
                            }.transition(.move(edge: .leading).combined(with: .opacity))
                            
                        }
                        
                        Spacer()
                    }
                    Spacer()
                    Text(value.description)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .scaleEffect(scaleValue)
                        .shadow(radius: 3)
                        .onChange(of: value) { newValue in
                            if newValue.description.count >= 6 {
                                scaleValue = 2.3
                            }
                        }
                    
                    Spacer()
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            value -= 1
                        } label: {
                            Image(systemName: "minus")
                                .font(.largeTitle)
                                .frame(width: g.size.width/3, height: 150)
                        }.buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundColor(.orange)
                            //.shadow(radius: 5)
                        
                        
                        Spacer()
                        
                        Button {
                            value+=1
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: g.size.width/3, height: 150)
                        }.buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundColor(.orange)
                            //.shadow(radius: 3)
                        
                        Spacer()
                    }
                    
                    //Spacer()
                }
            }
        }
        .animation(.easeInOut, value: showMenuItem1)
        .animation(.easeInOut, value: showMenuItem2)
        .animation(.easeInOut, value: showMenuItem3)
    }
    
    func showMenu() {
        showMenuItem3.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            showMenuItem2.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            showMenuItem1.toggle()
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}

struct SheetView:View {
    
    @Binding var isActive:Bool
    @Binding var value:Int
    @State var stringValue:String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isActive = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }.buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.red)
                        .padding()
                }
                Spacer()
                TextField("Set the Number", text: $stringValue)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(.white)
                    .foregroundColor(.orange)
                    .cornerRadius(15)
                    .padding()
                    .onAppear {
                        stringValue = String(value)
                    }
                Button {
                    value = Int(stringValue)!
                    isActive = false
                } label: {
                    Text("Update")
                        .bold()
                        .font(.largeTitle)
                }.buttonStyle(.borderedProminent)
                    .tint(.white)
                    .foregroundColor(.orange)

                Spacer()
            }
        }
    }
}
