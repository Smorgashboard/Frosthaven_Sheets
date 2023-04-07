//
//  LoadingView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 3/17/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                .scaleEffect(2)
            Text("Loading...")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
