//
//  TextInputFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct TextInputFormItemView: FormItemViewProtocol {
    @Binding var item: TextFormItem

    public init(item: Binding<TextFormItem>) {
        self._item = item
    }

    public var body: some View {
        TextInputView(placeholder: item.placeholder, text: $item.value)
            .formBackground(title: item.title)
    }
}

#Preview {
    TextInputFormItemView(item: .constant(.init(title: "Text Question", placeholder: "Enter your name")))
}
