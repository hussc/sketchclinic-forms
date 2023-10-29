//
//  SwiftUIView.swift
//  
//
//  Created by Hussein AlRyalat on 28/10/2023.
//

import SwiftUI

struct MultipleChoiceFilterItemView<Key: ChoicesFilterKey>: FilterItemView {
    typealias Choice = Key.Choice

    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles

    @EnvironmentObject var filterResult: FilterResult
    @State private var result: [Choice] = []

    let key: Key

    init(key: Key) {
        self.key = key
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Paddings.small) {
            ForEach(key.choices) { choice in
                let isChecked = key.choices.contains(choice)

                HStack(spacing: Paddings.small) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2.weight(.medium))
                        .foregroundColor(styles.accentColor)
                    Text(choice.text)
                        .foregroundColor(.textPrimary)
                        .font(.bodyFont)
                }
                .onTapGesture {
                    if let index = result.firstIndex(of: choice) {
                        result.remove(at: index)
                    } else {
                        result.append(choice)
                    }
                }

            }
        }
        .onChange(of: result) { newValue in
            self.filterResult.setValue(value: newValue, for: self.key)
        }.onAppear {
            if let foundResult = filterResult.value(for: key) {
                self.result = foundResult
            }
        }.onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification)) { _ in
            result = filterResult.value(for: key) ?? []
        }
    }
}

#Preview {
    struct MockChoiceItem: ChoiceItem {
        var text: String { "Choice" }
        var id: String { text }
    }

    struct ChoicesMockFilterItem: ChoicesFilterKey {
        var identifier: String { "single_choice" }
        var title: String? { "Hello World?" }
        var choices: [MockChoiceItem] { [MockChoiceItem(), MockChoiceItem(), MockChoiceItem()] }
    }

    return InlineFiltersView {
        ChoicesMockFilterItem()
    }
}
