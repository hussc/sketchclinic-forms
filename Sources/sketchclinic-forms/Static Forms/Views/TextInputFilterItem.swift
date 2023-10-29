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
            .font(.bodyFont)
    }
}

#Preview {
    struct MockFilterKey: TextFilterKey {
        var placeholder: String { "Placeholder" }
        var identifier: String { "text" }
        var text: String { "Text" }
        var title: String? { "Title" }
    }

    return InlineFiltersView {
        MockFilterKey()
    }
}
