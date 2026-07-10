//
//  SoundCardView.swift
//  Soundboard
//
//  Created by Raissa Raffi Darmawan on 05/07/26.
//

import SwiftUI

struct SoundCardView: View {
    @State var isActive: Bool = false
    @State var buttonColor: Color = .black.opacity(0.5)
    @State var backgroundColor: Color = .neutral
    @State var textWeight = Font.Weight.regular
    
    var body: some View {
        Button(action: {
            isActive.toggle()
            buttonColor = Color.appPrimary
            backgroundColor = Color.appPrimary.opacity(0.2)
            textWeight = Font.Weight.bold
            
        }, label: {
            VStack(spacing: 16) {
                Image(systemName: "horn.fill")
                    .font(.title)
                    .foregroundStyle(buttonColor)
                Text("Airhorn")
                    .font(.system(size: 16, weight: textWeight))
            }
            .frame(width: 100, height: 100)
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(cornerRadius: 24)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
            .foregroundStyle(buttonColor)
        })
    }
}

#Preview {
    SoundCardView()
}
