//
//  TextListFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 17/09/2023.
//

import SwiftUI


struct TextListFormItemView: View {
    @Binding var item: TextListFormItem
    
    @FocusState private var focusItem: FocusItem?
    @State private var newItem = ""
    
    enum FocusItem: Hashable {
        case newItem
        case existing(String)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Paddings.small) {
            ForEach(Array(item.value.enumerated()), id: \.offset) { index, item in
                TextField(self.item.placeholder, text: Binding(
                    get: {
                        self.item.value[index]
                    },
                    set: {
                        self.item.value[index] = $0
                    }
                ))
                .onSubmit(of: .text) {
                    if item.trimmed().isEmpty {
                        self.item.value.remove(at: index)
                    }
                }
                .font(.bodyFont)
            }

            TextField(item.placeholder, text: $newItem)
                .focused($focusItem, equals: .newItem)
            .onSubmit(of: .text) {
                if !newItem.isEmpty {
                    item.value.append(newItem)
                    newItem = ""
                    focusItem = .newItem
                }
            }
            .font(.bodyFont)
        }
        .font(.bodyFont)
        .formBackground(title: item.title)
    }
}

#Preview {
    TextListFormItemView(item: .constant(.textList("Drugs", placeholder: "Drug")))
}
