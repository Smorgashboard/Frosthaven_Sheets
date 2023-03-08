//
//  cardDetailedView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/26/23.
//

import SwiftUI

struct cardDetailedView: View {
    
    var card: Card
    
    var body: some View {
        Image("\(card.name)")
            .resizable()
            .scaledToFit()
    }
}

