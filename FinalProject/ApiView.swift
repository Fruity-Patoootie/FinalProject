//
//  ApiView.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 5/6/26.
//

import SwiftUI

struct ApiView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("Built with the ScryFall API")
                    .font(.subheadline)
                Divider()
                Text("Scryfall is one of the most powerful Magic: The Gathering websites. On it they display the prices and versions of every card in Magic: The Gathering History. The prices they display are from each of the major online retailers.")
                    .padding()
                Text("Laura Kirkpatrick Used this API to build this app. She really loved how they had a built-in commander randomizer, and some of her friends have been struggling to build new commander decks, so she thought that this app could help people like her friend find their next commander to build!")
                    .padding()
            }
            .padding()
        }
        .navigationTitle("API Info")
    }
}
