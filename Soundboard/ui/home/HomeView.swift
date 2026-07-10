//
//  HomeView.swift
//  Soundboard
//
//  Created by Raissa Raffi Darmawan on 05/07/26.
//

import SwiftUI

private var sound1: Sound = Sound(id: UUID(), name: "Sound 1", fileName: "zzzz", icon: "zzz", isCustom: false)

struct HomeView: View {

    @State private var keyword: String = ""
    @State private var sounds: [Sound] = [sound1]
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    if sounds.isEmpty {
                        Text("no sounds available!")
                            .font(.title2)
                            .foregroundStyle(Color.secondary)
                    } else {
                        TextField(
                            "Search sounds",
                            text: $keyword
                        )
                        .safeAreaInset(edge: .leading) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.appSecondary)
                        }
                        .padding(8)
                        .onSubmit {
                            // TODO
                        }
                        .autocorrectionDisabled()
                        .background(.neutral)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                        
                        HStack(spacing: 12) {
                            SoundCardView()
                            
                            Spacer()
                            
                            SoundCardView()
                            
                            Spacer()
                            
                            SoundCardView()
                        }
                    }
                }
                .padding()
            }
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Edit button tapped")
                    } label: {
                        Text("Edit")
                            .foregroundStyle(.blue)
                    }
                }
                
                ToolbarItem(placement: .title) {
                    Text("SoundFX")
                        .font(.title)
                        .bold()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .foregroundStyle(.blue)
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                AddSoundView(isShowingSheet: $isShowingSheet)
            }
            .toolbarTitleDisplayMode(.inline)
        }
    }
 }

#Preview {
    HomeView()
}
