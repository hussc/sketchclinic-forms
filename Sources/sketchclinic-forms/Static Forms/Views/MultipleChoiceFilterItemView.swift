//
//  SwiftUIView.swift
//  
//
//  Created by Hussein AlRyalat on 28/10/2023.
//

import SwiftUI
import SketchClinicFoundation

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
        ChoicesInputView(choices: key.choices, selectedChoices: filterResult.binding(for: key, defaultValue: []))
    }
}

#Preview {
    struct MockChoiceItem: ChoiceItem, FilterValueEncodable {
        var title: String { "Choice" }
        var id: String { title }
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
