//
//  TextListFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 17/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct TextListFormItemView: FormItemViewProtocol {
    @Binding var item: TextListFormItem

    public init(item: Binding<TextListFormItem>) {
        self._item = item
    }

    public var body: some View {
        TextListInputView(placeholder: item.placeholder, values: $item.value)
            .formBackground(title: item.title)
    }
}

#Preview {
    TextListFormItemView(item: .constant(.textList("Drugs", placeholder: "Drug")))
}
