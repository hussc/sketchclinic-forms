//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 29/10/2023.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public struct FiltersPoolPreferences: Codable, PreferenceKey {
    public typealias Value = Set<AnyFilterKey>

    public static var defaultValue: Set<AnyFilterKey> = []

    public static func reduce(value: inout Set<AnyFilterKey>, nextValue: () -> Set<AnyFilterKey>) {
        value.formUnion(nextValue())
    }
}

extension View {
    public func registeringFilter<Key: FilterKey>(_ filterKey: Key) -> some View {
        self.preference(key: FiltersPoolPreferences.self, value: [AnyFilterKey(key: filterKey)])
    }
}
