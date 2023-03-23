//
//  cardDetailedView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI

struct cardDetailedView: View {
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    var card: Card
    
    var body: some View {
        
        ZStack{
            mainBackgroundGradient.ignoresSafeArea()
            Image("\(card.imgName)")
                .resizable()
                .scaledToFit()
        }
    }
}

