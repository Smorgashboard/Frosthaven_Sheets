//
//  FAQView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/18/23.
//

import SwiftUI

struct FAQView: View {
    let mainBackgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.cyan, Color.black]),
        startPoint: .top, endPoint: .bottom)
    
    let allFAQS = faqs

    var body: some View {
        NavigationView {
            ZStack{
                mainBackgroundGradient.ignoresSafeArea()
                List(allFAQS, id: \.question) { faq in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(faq.question)
                            .font(.headline)
                        
                        Text(faq.answer)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                }
                .scrollContentBackground(Visibility.hidden)
                .navigationTitle("FAQ")
                .preferredColorScheme(.dark)
            }
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
