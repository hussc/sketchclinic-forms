//
//  ChoicesBasedFormItemProtocol.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public protocol ChoicesBasedFormItemProtocol: FormItemProtocol {
    var choices: [FormChoiceItem] { get set }
}

extension ChoicesBasedFormItemProtocol {
    public func choices(@FormChoicesBuilder _ choices: () -> [FormChoiceItem]) -> Self {
        var copy = self
        copy.choices = choices()
        return copy
    }
}
