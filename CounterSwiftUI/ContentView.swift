//
//  ContentView.swift
//  CounterSwiftUI
//
//  Created by Альберт Хайдаров on 25.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount: Int = 0
    
    var body: some View {
        
        Color.pink
            .ignoresSafeArea()
            .overlay (
                VStack {
                    
                    Text("Счетчик")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .padding(.top, 0.0)
        
                    
                    Button(action: {
                        tapCount += 1
                    })  {
                        Text("Значение счетчика \(tapCount)")
                        
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(.top, 169.0)
                    }
                    .padding(50)
                    HStack() {
                        Button (action: {
                            print("+")
                        }, label: {
                            Image("plus32")
                                .frame(width: 100.0, height: 100.0)
                              
//                                .foregroundColor(.green)
                        })
                      
                                            
                                            .scaledToFill()
//                        .padding(0.0)
//                        .buttonStyle(PlainButtonStyle())
//                        .foregroundColor(Color(red: 250, green: 147, blue: 150))
                        .foregroundColor(.white)
                        .clipShape(Circle())
//                        .buttonBorderShape(.capsule)
                        .contentShape(Circle())

                    }
                    .padding()
                    
                    
                })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
