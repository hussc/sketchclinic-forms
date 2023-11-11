//
//  ToggleFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

struct ToggleFilterItemView<Key: ToggleFilterKey>: FilterItemView {
    @EnvironmentObject var filterResult: FilterResult

    let key: Key
    
    init(key: Key) {
        self.key = key
    }
    
    var body: some View {
        CheckboxInputView(title: key.text, isChecked: filterResult.binding(for: key, defaultValue: false))
    }
}

struct ToggleFilterItemView_Previews: PreviewProvider {
    struct MockFilterKey: ToggleFilterKey {
        var identifier: String { "toggle" }
        var text: String { "Toggle here if you agree" }
        var title: String? { "Hello World?" }
    }
    
    static var previews: some View {
        MockFilterKey()
            .environmentObject(FilterResult())
    }
}
