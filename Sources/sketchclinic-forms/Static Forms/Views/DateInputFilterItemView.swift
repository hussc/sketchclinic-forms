//
//  DateInputFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 26/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

struct DateInputFilterItemView<Key: DateFilterKey>: FilterItemView {
    @EnvironmentObject private var filterResult: FilterResult

    let key: Key
    let dateFormatter: DateFormatter
    
    @State private var date: Date?
    
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
        VStack {
            Button {
                self.date = Date()
            } label: {
                Text("Select Date")
            }
            .buttonStyle(.secondary)
            .isHidden(date != nil)
            
            DateInputView(date: filterResult.binding(for: key, defaultValue: date ?? Date()))
                .isHidden(date == nil)
        }
        .animation(.bouncy, value: date)
        .onChange(of: date, perform: { date in
            if filterResult[key] != date {
                filterResult.setValue(value: date, for: key)
            }
        })
        .onReceive(filterResult.publisher(for: key), perform: { newValue in
            if newValue != date {
                self.date = newValue
            }
        })
        .onAppear {
            withAnimation(nil) {
                self.date = filterResult[key]
            }
        }
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
