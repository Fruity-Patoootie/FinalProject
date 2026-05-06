//
//  CardModel.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 4/27/26.
//
import Combine
import SwiftUI

struct ImageUris: Decodable{
    let normal: String
    
    init(_ normal: String){
        self.normal = ""
    }
}

class CardModel: Decodable {
    let name: String
    let imageUris: ImageUris?
    let manaCost: String?
    let typeLine: String
    let oracleText: String?
    let power: String?
    let toughness: String?
    let colorIdentity: [String]
}



class CardList: ObservableObject {
    @Published var cards: [CardViewModel] = []
    @Published var selectedCard: CardViewModel?
    
    init(){}
    
    func loadInitialCards()
    {
        for _ in 1...5{
            let card = CardViewModel()
            card.onUpdate = {
                [weak self] in self?.objectWillChange.send()
                if self?.selectedCard == nil{
                    self?.selectedCard = self?.cards.first
                }
            }
            card.FetchCard()
            self.cards.append(card)
        }
    }
}

enum Dev: String, CaseIterable, Identifiable{
    case laura, chandra, jace
    
    var id: String {self.rawValue}
    
    var description: String {
        switch self{
            case .laura: return "Laura has been developing apps for the past 6 months. This is her first really awesome swift app. She is very proud of the work she has done here!"
            case .chandra: return "Chandra is a fictional character from Magic: The Gathering. She did not develop this app, but Laura thought that it would be funny to include her in the developers list"
            case .jace: return "Jace is also a fictional character form Magic: The Gathering. Laura also thought that he would be a good candidate for this little enum."
        }
    }
    
    var image: ImageResource{
        switch self {
            case .laura:
                .nicepfp
            case .chandra:
                .chandra
            case .jace:
                .jace
        }
    }
    
    
}
