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
            RoundedRectangle(cornerRadius: 6)
                .stroke(styles.borders, lineWidth: 1)
                .background(Color.white)
                .frame(height: 53)
            HStack(spacing: 0) {
                Text(filterResult.value(for: key)?.text ?? placeholder)
                    .font(styles.bodyFont)
                    .foregroundColor(selectedChoice == nil ? styles.placeholderColor : styles.textColor)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 12))
                    .foregroundColor(styles.textColor)
            }.padding(.horizontal, 12)
        }.onTapGesture {
            if isEnabled {
                isSelectionSheetPresented.toggle()
            }
        }.onAppear {
            selectedChoice = filterResult.value(for: key)
        }.sheet(isPresented: $isSelectionSheetPresented) {
            DynamicChoicesSelectionView(title: placeholder, isMultiSelection: false, choicesHolder: key.choicesViewModel, showResultsTitle: .constant("apply".Localized())) { holder, choice in
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
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(choice.text)
                        .font(selectedChoice == choice ? styles.headlineFont : styles.bodyFont)
                        .foregroundColor(selectedChoice == choice ? styles.accentColor : styles.textColor)
                        .padding(.leading, 12)
                    Spacer()
                    Image(systemName: "checkmark")
                        .font(styles.bodyFont)
                        .foregroundColor(styles.accentColor)
                        .isHidden(selectedChoice != choice)
                        .padding(.trailing, 12)
                }.padding(.vertical, 16)
                
                Divider()
            }.padding(.horizontal, 16)
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
