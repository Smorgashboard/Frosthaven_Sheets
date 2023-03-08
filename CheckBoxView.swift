//
//  CheckBoxView.swift
//  Frost_digital_sheets
//
//  Created by Hackin Tosh on 2/27/23.
//

import SwiftUI
import CoreData

struct CheckBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}
    

