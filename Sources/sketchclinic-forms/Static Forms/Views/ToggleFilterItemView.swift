//
//  ToggleFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct ToggleFilterItemView<Key: ToggleFilterKey>: FilterItemView {
    @EnvironmentObject var filterResult: FilterResult
    @Environment(\.styles) var styles

    let key: Key
    
    init(key: Key) {
        self.key = key
    }
    
    var body: some View {
        Toggle(isOn: filterResult.binding(for: key, defaultValue: false)) {
            Text(key.text)
                .font(styles.bodyFont)
                .foregroundColor(styles.textColor)
        }
    }
}

struct ToggleFilterItemView_Previews: PreviewProvider {
    struct MockFilterKey: ToggleFilterKey {
        var identifier: String { "toggle" }
        var text: String { "Toggle here if you agree" }
    }
    
    static var previews: some View {
        ToggleFilterItemView(key: MockFilterKey())
            .environmentObject(FilterResult())
    }
}
