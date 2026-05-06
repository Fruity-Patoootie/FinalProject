//
//  AboutView.swift
//  FinalProject
//
//  Created by KIRKPATRICK, LAURA on 5/6/26.
//

import SwiftUI

struct AboutView: View {
    @State var selectedDev: Dev? = nil
    var body: some View {
        VStack {
            
            List(Dev.allCases){ devOption in
                HStack{
                    Image(devOption.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                    VStack{
                        Text(devOption.id.capitalized)
                            .padding(5)
                        Text(devOption.description)
                            .padding(5)
                    }
                }
            }
        }
        .navigationTitle("Developers!")
    }
}

#Preview {
    AboutView()
}
