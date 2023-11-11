//
//  DateInputFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct DateInputFormItemView: FormItemViewProtocol {
    @Binding var item: DateFormItem

    public init(item: Binding<DateFormItem>) {
        self._item = item
    }

    public var body: some View {
        DateInputView(date: $item.value)
            .formBackground(title: item.title)
    }
}

#Preview {
    DateInputFormItemView(item: .constant(.init(title: "Date Question")))
}
