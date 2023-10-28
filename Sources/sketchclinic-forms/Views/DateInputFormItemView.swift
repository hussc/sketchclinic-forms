//
//  DateInputFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


struct DateInputFormItemView: View {
    @Environment(\.accent) var accent
    @Binding var item: DateFormItem
    
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
