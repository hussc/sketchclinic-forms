//
//  LongTextFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import SwiftUI
import SketchClinicFoundation

struct LongTextFormItemView: FormItemViewProtocol {
    @Binding var item: LongTextFormItem

    public init(item: Binding<LongTextFormItem>) {
        self._item = item
    }

    public var body: some View {
        LongTextInputView(title: item.placeholder, icon: "doc.plaintext", text: $item.value)
    }
}

#Preview {
    LongTextFormItemView(item: .constant(.init(title: "Long Text Question", placeholder: "Write your answer here.")))
}
