//
//  SwiftUIView.swift
//  
//
//  Created by Hussein AlRyalat on 28/10/2023.
//

import SwiftUI

struct SingleChoiceFilterItemView<Key: SingleChoiceFilterKey>: FilterItemView {
    typealias Choice = Key.Choice

    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles

    @EnvironmentObject var filtersResult: FilterResult

    let key: Key

    init(key: Key) {
        self.key = key
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Paddings.small) {
            let choices = key.choices

            ForEach(choices) { choice in
                let isChecked = filtersResult[key] == choice

                HStack(spacing: Paddings.small) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2.weight(.medium))
                        .foregroundColor(styles.accentColor)
                    Text(choice.text)
                        .font(.bodyFont)
                        .foregroundColor(.textPrimary)
                }
                .onTapGesture { filtersResult.setValue(value: choice, for: key) }
            }
        }
    }
}

#Preview {
    struct MockChoiceItem: ChoiceItem {
        var text: String { "Choice " }
        var id: String { text }
    }

    struct SingleChoiceMockFilterItem: SingleChoiceFilterKey {
        typealias Choice = MockChoiceItem
        typealias Value = MockChoiceItem

        var identifier: String { "single_choice" }
        var text: String { "Single Choice" }
        var title: String? { "Hello World?" }
        var choices: [Choice] { [MockChoiceItem(), MockChoiceItem(), MockChoiceItem()] }
    }

    return InlineFiltersView {
        SingleChoiceMockFilterItem()
    }
}
