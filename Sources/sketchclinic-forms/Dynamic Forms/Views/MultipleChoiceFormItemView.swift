//
//  MultipleChoiceFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation

extension FormChoiceItem: ChoiceItem { }

public struct MultipleChoiceFormItemView: FormItemViewProtocol {
    @Environment(\.accent) var accent
    @Binding var item: MultipleChoicesFormItem

    public init(item: Binding<MultipleChoicesFormItem>) {
        self._item = item
    }

    public var body: some View {
        if item.choices.count > 4 {
            DynamicChoicesInputView(placeholder: item.title, loading: { item.choices }, selectedChoices: $item.value)
            .formBackground(title: item.title)
        } else {
            ChoicesInputView(choices: item.choices, selectedChoices: $item.value)
                .formBackground(title: item.title)
        }
    }
}

#Preview {
    let mocked = MultipleChoicesFormItem(title: "Pick one") {
        FormChoiceItem(title: "Choice 1", order: 0)
        FormChoiceItem(title: "Choice 2", order: 1)
        FormChoiceItem(title: "Choice 3", order: 2)
    }
    
    return MultipleChoiceFormItemView(item: .constant(mocked))
}
