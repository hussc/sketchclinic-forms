//
//  PlaceholderFormItemProtocol.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public protocol PlaceholderFormItemProtocol: FormItemProtocol {
    var placeholder: String { get set }
}

extension PlaceholderFormItemProtocol {
    public func placeholder(_ placeholder: String) -> Self {
        var copy = self
        copy.placeholder = placeholder
        return copy
    }
}
