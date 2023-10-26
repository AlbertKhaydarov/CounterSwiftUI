//
//  TextView.swift
//  SwiftUITextViewDemo
//
//  Created by Simon Ng on 7/5/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.9804422259, green: 0.5767289996, blue: 0.5899683237, alpha: 1)
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.isUserInteractionEnabled = false
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}
