//
//  NumberFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct NumberFormItemView: FormItemViewProtocol {
    @Binding var item: NumberFormItem

    public init(item: Binding<NumberFormItem>) {
        self._item = item
    }

    public var body: some View {
        NumberInputView(minValue: 0, maxValue: 10, step: 1, value: $item.value)
            .formBackground(title: item.title)
    }
}

#Preview {
    NumberFormItemView(item: .constant(.init(title: "Number Question", placeholder: "Enter a number", format: .decimal)))
}
