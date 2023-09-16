//
//  MultipleChoicesFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation
import CodableWrappers

public struct MultipleChoicesFormItem: ChoicesBasedFormItemProtocol {
    public var title: String
    public var order: Int
    public var choices: [FormChoiceItem]
    
    public var defaultValue: [FormChoiceItem]?
    public var value: [FormChoiceItem] = []
    
    public static var typeIdentifier: String {
        "multiple-choices"
    }
}

extension MultipleChoicesFormItem {
    public init(title: String, @FormChoicesBuilder _ choices: () -> [FormChoiceItem]) {
        self.title = title
        self.order = 0
        self.choices = choices()
        self.defaultValue = nil
        self.value = []
    }
    
    public func defaultValue(@FormChoicesBuilder _ choices: () -> [FormChoiceItem]) -> Self {
        var copy = self
        copy.defaultValue = choices()
        return copy
    }
}

extension FormItemProtocol {
    public static func multipleChoices(_ title: String, @FormChoicesBuilder _ choices: () -> [FormChoiceItem]) -> MultipleChoicesFormItem {
        MultipleChoicesFormItem(title: title, order: 0, choices: choices())
    }
}
