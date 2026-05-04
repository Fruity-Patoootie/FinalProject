//
//  CardViewModel.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 4/27/26.
//
import Combine
import SwiftUI

class CardViewModel: ObservableObject, Identifiable {
    @Published var name: String = ""
    @Published var imageUris : ImageUris = ImageUris.init("")
    @Published var manaCost: String = ""
    @Published var typeLine: String = ""
    @Published var oracleText: String = ""
    @Published var power: String? = ""
    @Published var toughness: String? = ""
    @Published var colorIdentity: [String] = []

    var onUpdate: (() -> Void)?
    
    func FetchCard() {
        guard let url = URL(string: "https://api.scryfall.com/cards/random?q=is%3Acommander") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request failed: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let card = try decoder.decode(CardModel.self, from: data)

                DispatchQueue.main.async {
                    self.name = card.name
                    self.imageUris = card.imageUris ?? ImageUris("")
                    self.manaCost = card.manaCost ?? ""
                    self.typeLine = card.typeLine
                    self.oracleText = card.oracleText ?? ""
                    self.power = card.power
                    self.toughness = card.toughness
                    self.colorIdentity = card.colorIdentity
                    
                    self.objectWillChange.send()
                    self.onUpdate?()
                }
            } catch {
                print("Decoding failed: \(error)")
            }
        }.resume()
    }
}
