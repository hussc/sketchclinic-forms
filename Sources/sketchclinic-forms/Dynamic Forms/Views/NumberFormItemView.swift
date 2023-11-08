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
        NumberInputView(minValue: 6, maxValue: 60, step: 1, value: $item.value)
            .formBackground(title: item.title)
    }
}

#Preview {
    let mockNumber = NumberFormItem(title: "Visual Acuity 6 / ", order: 1, format: .integer, placeholder: "6 / ??")

    return NumberFormItemView(item: .constant(mockNumber))
}
