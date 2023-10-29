//
//  DateInputFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


struct DateInputFormItemView: FormItemViewProtocol {
    @Environment(\.accent) var accent
    @Binding var item: DateFormItem

    init(item: Binding<DateFormItem>) {
        self._item = item
    }

    var body: some View {
        DatePicker(selection: _item.value, displayedComponents: .date) {
            EmptyView()
        }
        .datePickerStyle(.wheel)
        .tint(accent)
        .labelsHidden()
        .formBackground(title: item.title)
    }
}

#Preview {
    DateInputFormItemView(item: .constant(.init(title: "Date Question")))
}
