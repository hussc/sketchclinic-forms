//
//  DefaultMultipleChoiceFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

struct DynamicMultipleChoiceFilterItemView<Key: DynamicChoicesFilterKey>: FilterItemView {
    typealias Choice = Key.Choice
    typealias Value = [Key.Choice]
    
    @EnvironmentObject private var filterResult: FilterResult

    let key: Key
    let placeholder: String?

    init(key: Key) {
        self.key = key
        self.placeholder = key.placeholder
    }
    
    private var placeholderText: String {
        guard let value = filterResult.value(for: key) else { return placeholder ?? "" }
        return value.isEmpty ? placeholder ?? "" : value.map { $0.title }.joined(separator: ", ")
    }
    
    var body: some View {
        DynamicChoicesInputView(placeholder: placeholderText, loading: {
            try await key.choices(for: filterResult)
        }, selectedChoices: filterResult.binding(for: self.key, defaultValue: []))
    }
}

#Preview {
    struct MockChoiceItem: ChoiceItem, FilterValueEncodable {
        var title: String
        var id: String { title }
    }

    struct MockDynamicChoicesItem: DynamicChoicesFilterKey {
        typealias Choice = MockChoiceItem

        var placeholder: String? = "Pick a choice"
        var title: String? = "Beeps"
        var identifier: String = "filters"

        func choices(for result: FilterResult) async throws -> [MockChoiceItem] {
            [
                MockChoiceItem(title: "Beep 1"),
                MockChoiceItem(title: "Beep 2"),
                MockChoiceItem(title: "Beep 3"),
                MockChoiceItem(title: "Beep 4"),
                MockChoiceItem(title: "Beep 5"),
                MockChoiceItem(title: "Beep 6"),
                MockChoiceItem(title: "Beep 7"),
                MockChoiceItem(title: "Beep 8"),
                MockChoiceItem(title: "Beep 9"),
                MockChoiceItem(title: "Beep 10"),
                MockChoiceItem(title: "Beep 11"),
                MockChoiceItem(title: "Beep 12")
            ]
        }
    }

    return InlineFiltersView {
        MockDynamicChoicesItem()
    }
}
