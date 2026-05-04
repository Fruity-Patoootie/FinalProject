//
//  ContentView.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 4/27/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cardList = CardList()
    
    
    
    var body: some View {
        TabView{
            NavigationStack{
                // here is where the API stuff happens, shows 5 commanders that the user can use
                VStack(spacing: 24){
                    Text("Your Next Commander:")
                        .font(.title)
                    if let selectedCard = cardList.selectedCard{
                        VStack{
                            if !selectedCard.imageUris.normal.isEmpty
                            {
                                AsyncImage(url: URL(string: selectedCard.imageUris.normal)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(height: 300)
                                .id(selectedCard.imageUris.normal)
                                Text(selectedCard.name)
                                    .font(.headline)
                            }
                            else {
                                ProgressView()
                                    .frame(height: 300)
                            }
                        }
                        .id(selectedCard.id)
                    }

                    NavigationLink("Pick Another Commander!")
                    {
                        CardPickerView(cardList: cardList)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(cardList.cards.isEmpty)
                }
                .padding().navigationTitle("Home")
            }.tabItem{
                Label("Home", systemImage: "house")
            }
            .task{
                if cardList.cards.isEmpty{
                    cardList.loadInitialCards()
                }
            }
                // Here is the about developer segment. This is where we will have an enum about the developer
//                AboutView()
//                    .tabItem{
//                        Label("Dev About", systemImage: "info.circle")
//                    }
                // Here is where the API detial page will go. We will talk about scryfall and the other requirements
//                AboutView()
//                    .tabItem{
//                        Label("API About", systemImage: "sparkles")
//                    }
        }
    }
}

#Preview {
    ContentView()
}
