//
//  TextInputFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


struct TextInputFormItemView: FormItemViewProtocol {
    @Binding var item: TextFormItem

    init(item: Binding<TextFormItem>) {
        self._item = item
    }

    var body: some View {
        TextField(item.placeholder, text: _item.value)
            .font(.bodyFont)
            .formBackground(title: item.title)
    }
}

#Preview {
    TextInputFormItemView(item: .constant(.init(title: "Text Question", placeholder: "Enter your name")))
}
