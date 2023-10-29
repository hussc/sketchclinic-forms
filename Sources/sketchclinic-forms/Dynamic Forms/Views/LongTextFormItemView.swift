//
//  LongTextFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import SwiftUI


struct LongTextFormItemView: FormItemViewProtocol {
    @Binding var item: LongTextFormItem

    public init(item: Binding<LongTextFormItem>) {
        self._item = item
    }

    public var body: some View {
        FieldItemView(field: .init(identifier: item.id, name: item.title, icon: nil), text: _item.value)
    }
}

#Preview {
    LongTextFormItemView(item: .constant(.init(title: "Long Text Question", placeholder: "Write your answer here.")))
}
