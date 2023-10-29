//
//  DateInputFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 26/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct DateInputFilterItemView<Key: DateFilterKey>: FilterItemView {
    @EnvironmentObject private var filterResult: FilterResult
    
    @Environment(\.isRequired) var isRequired
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles

    let key: Key
    let dateFormatter: DateFormatter
    
    @State private var title: String?
    @State private var currentDateString: String? = nil
    @State private var showDatePicker = false
    
    init(key: Key) {
        self.key = key
        self.dateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.setLocalizedDateFormatFromTemplate(key.format == .date ? "dd/MM/yyyy" : "HH:mm")
            formatter.dateFormat = key.format == .date ? "dd/MM/yyyy" : "HH:mm"
            return formatter
        }()
    }
    
    var body: some View {
        DatePicker(selection: filterResult.binding(for: key, defaultValue: Date()), displayedComponents: .date) {
            EmptyView()
        }
        .datePickerStyle(.wheel)
        .tint(styles.accentColor)
        .labelsHidden()
    }
}

#Preview  {
    struct MockFilterKey: DateFilterKey {
        var format: DateFilterKeyFormat { .date }
        var identifier: String { "date" }
        var placeholder: String { "Date" }
        var title: String? { "Date" }
    }
    
    return InlineFiltersView {
        MockFilterKey()
    }
}
