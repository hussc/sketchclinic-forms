//
//  FilterValueDecodable.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 18/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation

public protocol FilterValueEncodable: Codable {
    func encodedValueForFilter() -> Any
}

extension Int: FilterValueEncodable {
    public func encodedValueForFilter() -> Any {
        self
    }
}

extension String: FilterValueEncodable {
    public func encodedValueForFilter() -> Any {
        self
    }
}

extension Bool: FilterValueEncodable {
    public func encodedValueForFilter() -> Any {
        self
    }
}

extension Double: FilterValueEncodable {
    public func encodedValueForFilter() -> Any {
        self
    }
}
