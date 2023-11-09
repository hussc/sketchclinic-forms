//
//  SwiftUIView.swift
//  
//
//  Created by Hussein AlRyalat on 28/10/2023.
//

import SwiftUI
import SketchClinicFoundation

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
        ChoicesInputView(choices: key.choices, selectedChoice: filtersResult.binding(for: key))
    }
}

#Preview {
    struct MockChoiceItem: ChoiceItem, FilterValueEncodable {
        var title: String { "Choice " }
        var id: String { title }
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
