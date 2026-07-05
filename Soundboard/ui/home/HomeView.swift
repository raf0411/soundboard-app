//
//  HomeView.swift
//  Soundboard
//
//  Created by Raissa Raffi Darmawan on 05/07/26.
//

import SwiftUI

struct HomeView: View {
    @State private var keyword: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
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
                    Text("Soundboard")
                        .bold()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Add button tapped")
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
