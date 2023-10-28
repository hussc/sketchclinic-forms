//
//  FilterKeyChangeModifier.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 23/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterKeyChangeModifier<Key: FilterKey>: ViewModifier {
    @EnvironmentObject var filterResult: FilterResult
    
    let key: Key
    let changeBlock: ((Key.Value) -> Void)
    
    func body(content: Content) -> some View {
        content.onReceive(filterResult.publisher(for: key)) { output in
            if let newValue = output {
                self.changeBlock(newValue)
            }
        }
    }
}

struct FiltersFilterKeyChangeModifier<Key: FilterKey>: ViewModifier {
    let key: Key
    let filters: FilterResult
    let changeBlock: ((Key.Value) -> Void)

    func body(content: Content) -> some View {
        content.onReceive(filters.publisher(for: key)) { output in
            if let newValue = output {
                self.changeBlock(newValue)
            }
        }
    }
}

extension View {
    public func onChange<Key: FilterKey>(of key: Key, perform: @escaping ((Key.Value) -> Void)) -> some View {
        self.modifier(FilterKeyChangeModifier(key: key, changeBlock: perform))
    }
    
    public func onChange<Key: FilterKey>(of key: Key, in filters: FilterResult, perform: @escaping ((Key.Value) -> Void)) -> some View {
        self.modifier(FiltersFilterKeyChangeModifier(key: key, filters: filters, changeBlock: perform))
    }
}
