//
//  MultipleChoiceFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


struct MultipleChoiceFormItemView: View {
    @Environment(\.accent) var accent
    @Binding var item: MultipleChoicesFormItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: Paddings.small) {
            ForEach(item.choices) { choice in
                let isChecked = item.value.contains(choice)
                
                HStack(spacing: Paddings.small) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2.weight(.medium))
                        .foregroundColor(accent)
                    Text(choice.title)
                        .foregroundColor(.textPrimary)
                        .font(.bodyFont)
                }
                .onTapGesture {
                    if let index = item.value.firstIndex(of: choice) {
                        item.value.remove(at: index)
                    } else {
                        item.value.append(choice)
                    }
                }
               
            }
        }
        .formBackground(title: item.title)
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
