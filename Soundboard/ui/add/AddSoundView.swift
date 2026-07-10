//
//  AddSoundView.swift
//  Soundboard
//
//  Created by Raissa Raffi Darmawan on 09/07/26.
//

import SwiftUI

struct Icon {
    var name: String
    var isActive: Bool
}

struct AddSoundView: View {
    @State private var soundName: String = ""
    @State private var icons: [Icon] = [
        Icon(
            name: "face.smiling.inverse", isActive: false
        ),
        Icon(
            name: "gamecontroller", isActive: false
        ),
        Icon(
            name: "bell.and.waves.left.and.right", isActive: false
        ),
        Icon(
            name: "microphone", isActive: false
        ),
        Icon(
            name: "music.note", isActive: false
        )
    ]
    @State private var selectedIcon: Int = 0
    @State private var isFileEmpty: Bool = true
    
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .opacity(0.0)
                    .background(.neutral)
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading) {
                        Text("SOUND NAME")
                            .font(.callout)
                            .foregroundStyle(.black.opacity(0.5))
                        
                        TextField(
                            "Sound Name",
                            text: $soundName
                        )
                        .padding(12)
                        .onSubmit {
                            // TODO
                        }
                        .autocorrectionDisabled()
                        .background(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("ICON")
                            .font(.callout)
                            .foregroundStyle(.black.opacity(0.5))
                            .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                                ForEach(icons.indices, id: \.self) { index in
                                        Button(
                                            action: {
                                                selectedIcon = index
                                            },
                                            label: {
                                                Image(systemName: icons[index].name)
                                                    .font(.title2)
                                                    .frame(width: 30, height: 40)
                                                    .padding(4)
                                            }
                                        )
                                        .buttonStyle(.bordered)
                                        .buttonBorderShape(.roundedRectangle(radius: 16))
                                        .tint(selectedIcon == index ? .blue : .secondary)
                                }
                            }
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .background(.white)
                    }
                    
                    if isFileEmpty {
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue.opacity(0.1))
                                    .frame(width: 50)
                                
                                Image(systemName: "text.document")
                                    .font(.title3)
                                    .foregroundStyle(.blue)
                            }
                            
                            Text("Add sound from file")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.appPrimary)
                            
                            Text("Supports MP3, WAV, M4A")
                                .font(.subheadline)                    }
                        .onTapGesture {
                            print("Pressed add sound")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                    } else {
                        VStack(alignment: .leading) {
                            Text("DETAILS")
                                .font(.callout)
                                .foregroundStyle(.black.opacity(0.5))
                                .padding(.horizontal)
                            
                            List {
                                Section {
                                    HStack {
                                        Text("File Type")
                                        Spacer()
                                        Text(".mp3")
                                            .foregroundStyle(.gray)
                                    }
                                    HStack {
                                        Text("Duration")
                                        Spacer()
                                        Text("0:04")
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.blue)
                    }
                }
                
                ToolbarItem(placement: .title) {
                    Text("Add Sound")
                        .bold()
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        
                    } label: {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
            }
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddSoundView(isShowingSheet: .constant(true))
}
