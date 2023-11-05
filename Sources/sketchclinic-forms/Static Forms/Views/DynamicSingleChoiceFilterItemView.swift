//
//  DeafultSingleChoiceFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct DynamicSingleChoiceFilterItemView<Key: DynamicSingleChoiceFilterKey>: FilterItemView {
    typealias Choice = Key.Choice
    typealias Value = Key.Choice
    
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles
    @EnvironmentObject var filterResult: FilterResult
    
    private var selectedChoice: Choice? {
        nonmutating set {
            filterResult.setValue(value: newValue, for: key)
        } get {
            filterResult[key]
        }
    }
    
    @State private var isSelectionSheetPresented: Bool = false
    
    let key: Key
    let placeholder: String
    
    init(key: Key) {
        self.key = key
        self.placeholder = key.placeholder
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Text(filterResult.value(for: key)?.title ?? placeholder)
                    .font(.bodyFont)
                    .foregroundColor(selectedChoice == nil ? .textSecondary : styles.accentColor)
                Spacer()
                Image(systemName: "chevron.up.chevron.down")
                    .font(.bodyFont)
                    .foregroundColor(styles.textColor)
            }
            .padding(.vertical, 8)
        }.onTapGesture {
            if isEnabled {
                isSelectionSheetPresented.toggle()
            }
        }.onAppear {
            selectedChoice = filterResult.value(for: key)
        }.sheet(isPresented: $isSelectionSheetPresented) {
            DynamicChoicesSelectionView(title: placeholder, isMultiSelection: false, choicesHolder: key.choicesViewModel, showResultsTitle: .constant("Select")) { holder, choice in
                view(for: choice)
            } onDismiss: { saveSelection in
                if saveSelection {
                    self.filterResult.setValue(value: selectedChoice, for: key)
                } else {
                    self.selectedChoice = nil
                }
            }
        }.onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification)) { _ in
            selectedChoice = filterResult.value(for: key)
        }
    }
    
    @ViewBuilder func view(for choice: Choice) -> some View {
        HStack(spacing: Paddings.smallX) {
            Image(systemName: selectedChoice == choice ? "checkmark.square" : "square")
                .font(.bodyFont)
                .foregroundColor(styles.accentColor)
            Text(choice.title)
                .font(selectedChoice == choice ? styles.headlineFont : styles.bodyFont)
                .foregroundColor(selectedChoice == choice ? styles.accentColor : .textPrimary)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.backgroundSecondary)
        }
        .onTapGesture {
            if selectedChoice == choice {
                selectedChoice = nil
            } else {
                selectedChoice = choice
            }
        }
    }
}


#Preview {
    struct MockChoiceItem: ChoiceItem {
        var title: String
        var id: String { title }
    }

    struct MockDynamicSingleChoiceItem: DynamicSingleChoiceFilterKey {
        typealias Choice = MockChoiceItem

        var placeholder: String = "Pick a choice"
        var title: String? = "Beeps"
        var identifier: String = "filters"

        func choices(for result: FilterResult) async throws -> [MockChoiceItem] {
            [
                MockChoiceItem(title: "Beep 1"),
                MockChoiceItem(title: "Beep 2"),
                MockChoiceItem(title: "Beep 3"),
                MockChoiceItem(title: "Beep 4"),
                MockChoiceItem(title: "Beep 5"),
                MockChoiceItem(title: "Beep 6"),
                MockChoiceItem(title: "Beep 7"),
                MockChoiceItem(title: "Beep 8"),
                MockChoiceItem(title: "Beep 9"),
                MockChoiceItem(title: "Beep 10"),
                MockChoiceItem(title: "Beep 11"),
                MockChoiceItem(title: "Beep 12")
            ]
        }
    }

    return InlineFiltersView {
        MockDynamicSingleChoiceItem()
    }
}

