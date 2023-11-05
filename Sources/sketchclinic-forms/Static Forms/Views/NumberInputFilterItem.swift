//
//  NumberInputFilterItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 25/09/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct NumberInputFilterItem<Key: NumberFilterKey>: FilterItemView {
    typealias Value = String
        
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles

    @EnvironmentObject var filtersResult: FilterResult
    
    let key: Key
    
    init(key: Key) {
        self.key = key
    }
    
    var body: some View {
        TextField(key.placeholder, value: filtersResult.binding(for: key, defaultValue: 0), format: .number)
            .keyboardType(.numberPad)
            .font(.bodyFont)
    }
}
