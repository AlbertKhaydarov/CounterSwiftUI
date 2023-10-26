//
//  ContentView.swift
//  CounterSwiftUI
//
//  Created by Альберт Хайдаров on 25.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount: Int = 0
    @State private var message = "История изменений"
    @State private var textStyle = UIFont.TextStyle.body
    @State private var changeHistoryText: [String] = []
    
    var body: some View {
        Color.pink
            .ignoresSafeArea()
            .overlay (
                VStack {
                    Text("Счетчик")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .padding(.top, 50.0)
                    
                    HStack(spacing: 20) {
                        Text("Значение счетчика")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        
                        Text("\(tapCount)")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .padding(50)
                    
                    HStack(spacing: 20.0) {
                        Button(action: {
                            increaseCountAction()
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                                .padding(20)
                                .foregroundColor(.red)
                                .background(
                                    Circle()
                                        .fill(Color(red: 0.9804422259, green: 0.5767289996, blue: 0.5899683237))
                                        .frame(width: 100.0, height: 100.0)
                                )
                        }
                        Button(action: {
                            resetCountAction()
                        }) {
                            Image(systemName: "repeat")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                                .padding(20)
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color(red: 0.9804422259, green: 0.5767289996, blue: 0.5899683237))
                                        .frame(width: 100.0, height: 100.0)
                                )
                        }
                        
                        Button(action: {
                            decreaseCountAction()
                        }) {
                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 50.0, height: 5.0)
                            
                                .padding(20)
                                .foregroundColor(.blue)
                                .background(
                                    Circle()
                                    
                                        .fill(Color(red: 0.9804422259, green: 0.5767289996, blue: 0.5899683237))
                                        .frame(width: 100.0, height: 100.0)
                                )
                        }
                    }
                    .padding(50)
                    
                        TextView(text: $message, textStyle: $textStyle)
                            .padding(.horizontal)
                            .padding([.leading, .bottom, .trailing], 20.0)
                })
    }
    
   private func updateHistory(){
       var text = "История изменений:\n"
       for item in changeHistoryText {
           text = text + item + "\n"
       }
        message = text
   }
    
    private func createDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let date = Date()
        return dateFormatter.string(from: date)
    }
    
    private func increaseCountAction() {
        tapCount += 1
        changeHistoryText.insert("[\(createDate())]: значение изменено на +1", at: 0)
        updateHistory()
    }
    
    private func decreaseCountAction() {
        if tapCount > 0 {
            tapCount -= 1
            changeHistoryText.insert("[\(createDate())]: значение изменено на -1", at: 0)
            updateHistory()
        } else {
            changeHistoryText.insert("[\(createDate())]: попытка уменьшить значение счётчика ниже 0", at: 0)
            updateHistory()
        }
    }
    
    private func resetCountAction() {
        tapCount = 0
        changeHistoryText.insert("[\(createDate())]: значение сброшено", at: 0)
        updateHistory()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
