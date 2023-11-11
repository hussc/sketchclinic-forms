//
//  SingleChoiceFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct SingleChoiceFormItemView: FormItemViewProtocol {
    @Binding var item: SingleChoiceFormItem
    
    public init(item: Binding<SingleChoiceFormItem>) {
        self._item = item
    }

    public var body: some View {
        if item.choices.count > 4 {
            DynamicChoicesInputView(placeholder: item.title, loading: { item.choices }, selectedChoice: $item.value)
            .formBackground(title: item.title)

        } else {
            ChoicesInputView(choices: item.choices, selectedChoice: $item.value)
                .formBackground(title: item.title)
        }
    }
}

#Preview {
    let mocked = SingleChoiceFormItem(title: "Pick one") {
        FormChoiceItem(title: "Choice 1", order: 0)
        FormChoiceItem(title: "Choice 2", order: 1)
        FormChoiceItem(title: "Choice 3", order: 2)
    }
    
    return SingleChoiceFormItemView(item: .constant(mocked))
}
