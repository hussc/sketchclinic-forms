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
    @Environment(\.styles) var styles

    enum CheckboxStyle {
        case square
        case circle
    }

    let style: CheckboxStyle = .square
    let key: Key
    
    init(key: Key) {
        self.key = key
    }
    
    var body: some View {
        HStack(spacing: Paddings.small) {
            Image(systemName: (filterResult[key] ?? false) ? style.selectedImageName : style.unselectedImageName)
                .symbolRenderingMode(.hierarchical)
                .font(.title2.weight(.medium))
                .foregroundColor(styles.accentColor)
            Text(key.text)
                .font(.bodyFont)
                .foregroundColor(.textPrimary)
        }
        .onTapGesture {
            filterResult.setValue(value: !(filterResult[key] ?? false), for: key)
        }
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

extension ToggleFilterItemView.CheckboxStyle {
    var selectedImageName: String {
        switch self {
        case .square:
            return "checkmark.square.fill"
        case .circle:
            return "checkmark.circle.fill"
        }
    }

    var unselectedImageName: String {
        switch self {
        case .square:
            return "square"
        case .circle:
            return "circle"
        }
    }
}
