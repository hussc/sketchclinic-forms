//
//  CheckboxFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct CheckboxFormItemView: FormItemViewProtocol {
    @Binding var item: BooleanFormItem
    
    public init(item: Binding<BooleanFormItem>) {
        self._item = item
    }
    
    public var body: some View {
        CheckboxInputView(title: item.placeholder, isChecked: $item.value)
            .formBackground(title: item.title)
    }
}

#Preview {
    var mockItem = BooleanFormItem(placeholder: "Do you love me")
    mockItem.value = true
    
    return CheckboxFormItemView(item: .constant(mockItem))
        .accent(.messageSuccess)
}
