//
//  SingleChoiceFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


struct SingleChoiceFormItemView: FormItemViewProtocol {
    @Environment(\.accent) var accent
    
    @Binding var item: SingleChoiceFormItem
    
    init(item: Binding<SingleChoiceFormItem>) {
        self._item = item
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Paddings.small) {
            ForEach(item.choices) { choice in
                let isChecked = item.value == choice
                
                HStack(spacing: Paddings.small) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2.weight(.medium))
                        .foregroundColor(accent)
                    Text(choice.title)
                        .font(.bodyFont)
                        .foregroundColor(.textPrimary)
                }
                .onTapGesture { item.value = choice }
            }
        }.formBackground(title: item.title)
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
