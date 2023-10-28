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
    let placeholder: String
    
    init(key: Key) {
        self.key = key
        self.placeholder = key.placeholder
    }
    
    private var placeholderText: String {
        guard let value = filterResult.value(for: key) else { return placeholder }
        return value.isEmpty ? placeholder : value.map { $0.text }.joined(separator: ", ")
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(styles.borders, lineWidth: 1)
                .background(Color.white)
                .frame(height: 45)
            HStack(spacing: 0) {
                Text(placeholderText)
                    .font(styles.bodyFont)
                    .foregroundColor(selectedChoices.isEmpty ? styles.placeholderColor : styles.textColor)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 12))
                    .foregroundColor(styles.textColor)
            }.padding(.horizontal, 12)
        }.onTapGesture {
            isSelectionSheetPresented = true
        }.onChange(of: selectedChoices, perform: { newValue in
            self.showResultsTitle = "apply_selected_count".Localized().replacingOccurrences(of: "%s", with: "\(selectedChoices.count)")
        }).onAppear {
            self.selectedChoices = filterResult.value(for: key) ?? []
        }.sheet(isPresented: $isSelectionSheetPresented) {
            DynamicChoicesSelectionView(title: placeholder, isMultiSelection: true, choicesHolder: key.choicesViewModel, showResultsTitle: $showResultsTitle) { holder, choice in
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
                Text(choice.text)
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

extension Array where Element: Equatable {
    func isLastElement(_ element: Element) -> Bool {
        (firstIndex(of: element) == count - 1)
    }
}

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
