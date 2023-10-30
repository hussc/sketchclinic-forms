//
//  TabsFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct TabsFilterItemView<Key: SingleChoiceFilterKey>: FilterItemView {
    typealias Value = Key.Choice
    typealias Choice = Key.Choice
    
    let key: Key
    let choices: [Choice]
    
    @Environment(\.styles) var styles
    @EnvironmentObject var filtersResult: FilterResult
    
    @State private var selectedIndex: Int = 0
    
    init(key: Key) {
        self.key = key
        self.choices = key.choices
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(choices.indices, id: \.self) { index in
                        Button(action: { self.selectedIndex = index }) {
                            Spacer()
                            Text(self.choices[index].title)
                                .foregroundColor(selectedIndex == index ? styles.accentColor : styles.placeholderColor)
                                .font(selectedIndex == index ? styles.headlineFont : styles.bodyFont)
                            Spacer()
                        }.frame(height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(styles.accentColor)
                                    .isHidden(selectedIndex != index)
                            )
                    }
                }
            }
            .animation(.default, value: selectedIndex)
            .background(RoundedRectangle(cornerRadius: 6).stroke(styles.borders, lineWidth: 1))
            .onChange(of: selectedIndex) { newValue in
                self.filtersResult.setValue(value: choices[newValue], for: self.key)
            }.onAppear {
                if let value = self.filtersResult.value(for: self.key) {
                    self.selectedIndex = choices.firstIndex(of: value) ?? 0
                } else {
                    self.filtersResult.setDefaultValue(value: choices[0], for: self.key)
                }
            }.onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification)) { _ in
                if let value = self.filtersResult.value(for: self.key) {
                    self.selectedIndex = choices.firstIndex(of: value) ?? 0
                }
            }
        }
    }
}
