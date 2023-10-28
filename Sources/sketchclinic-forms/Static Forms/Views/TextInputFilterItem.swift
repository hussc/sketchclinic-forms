//
//  TextInputFilterItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI

struct TextInputFilterItem<Key: TextFilterKey>: FilterItemView {
    typealias Value = String
        
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles

    @EnvironmentObject var filtersResult: FilterResult
    
    let key: Key
    
    init(key: Key) {
        self.key = key
    }
    
    var body: some View {
        TextField(key.placeholder, text: filtersResult.binding(for: key, defaultValue: ""))
            .frame(height: 53)
            .font(styles.bodyFont)
            .foregroundColor(styles.textColor)
            .keyboardType(key.keyboardType ?? .default)
            .multilineTextAlignment(key.textAlignment)
            .lineLimit(1)
    }
}
