//
//  ChoiceItem.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation

public protocol ChoiceItem: FilterValueEncodable, Identifiable, Equatable, Hashable {
    var text: String { get }
}

extension ChoiceItem {
    public var stringRepresentation: String { text }
}
