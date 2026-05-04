//
//  CardPickerView.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 4/29/26.
//

import SwiftUI
import Combine

struct CardPickerView: View {
    @ObservedObject var cardList: CardList
    @Environment(\.dismiss) var dismiss
    var body: some View
    {
        ForEach(cardList.cards){card in
            Button{
                cardList.selectedCard = card
                cardList.objectWillChange.send()
                dismiss()
            } label: {
                HStack{
                        HStack{
                            if let url = URL(string: card.imageUris.normal), !card.imageUris.normal.isEmpty {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 100)
                        } else {
                            ProgressView()
                                .frame(height: 100)
                        }
                        Text(card.name)
                            .font(.headline)
                        ForEach(card.colorIdentity, id: \.self){ ident in
                            Text(ident)
                        }
                    }
                }
            }
        }.navigationTitle("Pick Your Commander")
    }
}


#Preview {
    NavigationStack{
        CardPickerView(cardList: CardList())
    }
}
