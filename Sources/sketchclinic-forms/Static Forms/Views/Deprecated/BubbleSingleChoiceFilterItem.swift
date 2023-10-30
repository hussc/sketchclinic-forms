//
//  BubbleSingleChoiceFilterItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 17/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct BubbleSingleChoiceFilterItem<Key: SingleChoiceFilterKey>: FilterItemView {
    typealias Choice = Key.Choice
    
    @EnvironmentObject var filterResult: FilterResult

    @State private var result: Choice?
    @State private var choices: [Choice]
    @State private var manuallyUpdatedResult = false
    
    let key: Key
    
    init(key: Key) {
        self.key = key
        self._choices = .init(initialValue: key.choices)
    }
    
    var body: some View {
        FlowLayoutView(items: $choices) { choice in
            ChoiceItemView(choice: choice, isSelected: choice == result)
                .onTapGesture {
                    self.result = choice
                }
        }.onChange(of: result) { newValue in
            manuallyUpdatedResult = true
            self.filterResult.setValue(value: newValue, for: self.key)
        }.onAppear {
            if let foundResult = filterResult.value(for: key) {
                self.result = foundResult
            }
        }.onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification)) { _ in
            result = filterResult.value(for: key)
        }
    }
}

extension BubbleSingleChoiceFilterItem {
    struct ChoiceItemView: View {
        let choice: Choice
        let isSelected: Bool

        @Environment(\.styles) var styles

        var body: some View {
            Text(choice.title)
                .font(styles.bodyFont)
                .foregroundColor(isSelected ? styles.accentColor : styles.secondaryTextColor)
                .padding()
                .background(
                    Capsule(style: .circular)
                        .stroke(isSelected ? styles.accentColor : styles.secondaryTextColor, lineWidth: 1)
                        .background(styles.backgroundColor)
                        .clipped()
                ).clipShape(Capsule())
        }
    }
}
