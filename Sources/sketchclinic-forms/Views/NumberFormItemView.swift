//
//  NumberFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import SwiftUI


struct NumberFormItemView: View {
    @Binding var item: NumberFormItem
    
    var body: some View {
        TextField(item.placeholder, value: $item.value, format: .number)
            .keyboardType(.numberPad)
            .font(.bodyFont)
            .formBackground(title: item.title)
    }
}

#Preview {
    NumberFormItemView(item: .constant(.init(title: "Number Question", placeholder: "Enter a number", format: .decimal)))
}