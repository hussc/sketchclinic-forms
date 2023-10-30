//
//  DefaultMultipleChoiceFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct DynamicMultipleChoiceFilterItemView<Key: DynamicChoicesFilterKey>: FilterItemView {
    typealias Choice = Key.Choice
    typealias Value = [Key.Choice]
    
    @EnvironmentObject private var filterResult: FilterResult
    
    @State private var selectedChoices: Array<Choice> = []
    @State private var isSelectionSheetPresented: Bool = false
    @State private var showResultsTitle = "apply".Localized()

    @Environment(\.styles) var styles

    let key: Key
    let placeholder: String?

    init(key: Key) {
        self.key = key
        self.placeholder = key.placeholder
    }
    
    private var placeholderText: String {
        guard let value = filterResult.value(for: key) else { return placeholder ?? "" }
        return value.isEmpty ? placeholder ?? "" : value.map { $0.title }.joined(separator: ", ")
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Text(placeholderText)
                    .font(styles.bodyFont)
                    .foregroundColor(selectedChoices.isEmpty ? .textSecondary : styles.accentColor)
                Spacer()
                Image(systemName: "chevron.up.chevron.down")
                    .font(.bodyFont)
                    .foregroundColor(.textPrimary)
            }.padding(.vertical, 8)
        }.onTapGesture {
            isSelectionSheetPresented = true
        }.onChange(of: selectedChoices, perform: { newValue in
            self.showResultsTitle = "Select (\(newValue.count))"
        }).onAppear {
            self.selectedChoices = filterResult.value(for: key) ?? []
        }.sheet(isPresented: $isSelectionSheetPresented) {
            DynamicChoicesSelectionView(title: placeholder ?? "", isMultiSelection: true, choicesHolder: key.choicesViewModel, showResultsTitle: $showResultsTitle) { holder, choice in
                view(for: choice, holder: holder)
            } onDismiss: { saveSelection in
                if saveSelection {
                    filterResult.setValue(value: selectedChoices, for: self.key)
                } else {
                    self.selectedChoices = []
                }
            }
        }.onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification)) { _ in
            selectedChoices = filterResult.value(for: key) ?? []
        }
    }

    @ViewBuilder func view(for choice: Choice, holder: DynamicChoicesHolder<Choice>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: selectedChoices.contains(choice) ?  "checkmark.square.fill" : "square")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(selectedChoices.contains(choice) ? styles.accentColor : styles.textColor)
                Spacer().frame(width: 8)
                Text(choice.title)
                    .font(styles.bodyFont)
                    .foregroundColor(styles.textColor)
            }.padding(.vertical, 16)
            
            Divider().isHidden(holder.choices.isLastElement(choice))
        }.padding(.horizontal, 16)
            .onTapGesture {
                if let index = selectedChoices.firstIndex(of: choice) {
                    selectedChoices.remove(at: index)
                } else {
                    selectedChoices.append(choice)
                }
            }
    }
}

fileprivate extension Array where Element: Equatable {
    func isLastElement(_ element: Element) -> Bool {
        (firstIndex(of: element) == count - 1)
    }
}

#Preview {
    struct MockChoiceItem: ChoiceItem {
        var title: String
        var id: String { title }
    }

    struct MockDynamicChoicesItem: DynamicChoicesFilterKey {
        typealias Choice = MockChoiceItem

        var placeholder: String? = "Pick a choice"
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
        MockDynamicChoicesItem()
    }
}
