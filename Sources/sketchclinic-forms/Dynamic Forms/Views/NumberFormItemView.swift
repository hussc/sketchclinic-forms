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
    let numbersList: [Double]

    public init(item: Binding<NumberFormItem>) {
        self._item = item
        self.numbersList = Array(stride(from: item.wrappedValue.minValue, to: item.wrappedValue.maxValue, by: item.wrappedValue.step))
    }

    public var body: some View {
        Picker(item.title, selection: $item.value) {
            ForEach(numbersList, id: \.self) { number in
                Text(number, format: .number.decimalSeparator(strategy: .automatic))
            }
        }
        .pickerStyle(.wheel)
        .formBackground(title: item.title)
    }
}

#Preview {
    let mockNumber = NumberFormItem(title: "Visual Acuity 6 / ", minValue: 6, maxValue: 60, step: 1, format: .integer)

    return NumberFormItemView(item: .constant(mockNumber))
}
