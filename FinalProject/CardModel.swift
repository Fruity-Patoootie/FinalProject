//
//  CardModel.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 4/27/26.
//
import Combine

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

//enum CardList {
//    case card1, card2, card3, card4, card5
//    
//    var card: CardViewModel
//    {
//        switch self
//        {
//            case .card1: return CardViewModel.init()
//            case .card2: return CardViewModel.init()
//            case .card3: return CardViewModel.init()
//            case .card4: return CardViewModel.init()
//            case .card5: return CardViewModel.init()
//        }
//    }
//}
