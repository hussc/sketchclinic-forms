//
//  NumberInputFilterItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 25/09/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

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
        NumberInputView(minValue: key.minValue, maxValue: key.maxValue, step: key.step, value: filtersResult.binding(for: key, defaultValue: key.minValue))
    }
}
