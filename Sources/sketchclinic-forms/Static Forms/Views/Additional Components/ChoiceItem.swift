//
//  ChoiceItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation

#if canImport(SketchClinicFoundation)
import SketchClinicFoundation
#else
public protocol ChoiceItem: FilterValueEncodable, Identifiable, Equatable, Hashable {
    var title: String { get }
}

extension ChoiceItem {
    public var stringRepresentation: String { title }
}
#endif

extension FilterValueEncodable where Self: ChoiceItem {
    public func encodedValueForFilter() -> Any {
        id
    }
}

extension Array: FilterValueEncodable where Self.Element: ChoiceItem, Element: FilterValueEncodable {
    public func encodedValueForFilter() -> Any {
        self.map { $0.encodedValueForFilter() }
    }
}
