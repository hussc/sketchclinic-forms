//
//  ChoicesFilterItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

struct BubbleChoicesFilterItem<Key: ChoicesFilterKey>: FilterItemView {
    typealias Value = [Key.Choice]
    typealias Choice = Key.Choice
    
    @EnvironmentObject var filterResult: FilterResult
    @State private var result: [Choice] = []
    
    let key: Key
    
    init(key: Key) {
        self.key = key
    }
    
    var body: some View {
        FlowLayoutView(items: .constant(key.choices)) { choice in
            ChoiceItemView(choice: choice, isSelected: result.contains(choice))
                .onTapGesture {
                    if let index = result.firstIndex(of: choice) {
                        result.remove(at: index)
                    } else {
                        result.append(choice)
                    }
                }
        }.onChange(of: result) { newValue in
            self.filterResult.setValue(value: newValue, for: self.key)
        }.onAppear {
            if let foundResult = filterResult.value(for: key) {
                self.result = foundResult
            }
        }.onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification)) { _ in
            result = filterResult.value(for: key) ?? []
        }
    }
}

extension BubbleChoicesFilterItem {
    struct ChoiceItemView: View {
        @Environment(\.styles) var styles

        let choice: Choice
        let isSelected: Bool
        
        var body: some View {
            Text(choice.title)
                .font(styles.bodyFont)
                .foregroundColor(isSelected ? styles.accentColor : styles.secondaryTextColor)
                .padding()
                .background(
                    Capsule(style: .circular)
                        .stroke(isSelected ? styles.borders : styles.borders, lineWidth: 1.5)
                        .background(isSelected ? styles.secondaryBackgroundColor : styles.backgroundColor)
                        .clipped()
                ).clipShape(Capsule())
        }
    }
}
