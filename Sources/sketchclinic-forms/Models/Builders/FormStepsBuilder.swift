//
//  FormStepsBuilder.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

@resultBuilder
public struct FormStepContainerBuilder {
    
    // For single items
    public static func buildExpression(_ item: FormStepContainer) -> FormStepContainer {
        return item
    }
    
    // For groups of items
    public static func buildBlock(_ items: FormStepContainer...) -> [FormStepContainer] {
        // Modify the order property based on the sequence
        for (index, item) in items.enumerated() {
            item.order = index + 1
        }
        return items
    }
    
    // For optional items
    public static func buildOptional(_ item: FormStepContainer?) -> FormStepContainer? {
        return item
    }
    
    // For conditional items
    public static func buildEither(first: FormStepContainer) -> FormStepContainer {
        return first
    }
    
    public static func buildEither(second: FormStepContainer) -> FormStepContainer {
        return second
    }
    
    // For arrays of items
    public static func buildArray(_ components: [FormStepContainer]) -> [FormStepContainer] {
        // Modify the order property based on the sequence
        for (index, item) in components.enumerated() {
            item.order = index + 1
        }
        return components
    }
    
    // For final result conversion
    public static func buildFinalResult(_ component: [FormStepContainer]) -> [FormStepContainer] {
        return component
    }
}


extension FormStepContainer {
    public convenience init(title: String, description: String? = nil, icon: String? = nil, @FormItemsBuilder _ fields: () -> [FormItemProtocol]) {
        self.init(title: title, description: description, icon: icon, order: 0, fields: fields())
    }
    
    @discardableResult
    public func title(_ title: String) -> FormStepContainer {
        self.title = title
        return self
    }
    
    @discardableResult
    public func description(_ description: String) -> FormStepContainer {
        self.description = description
        return self
    }
    
    @discardableResult
    public func order(_ order: Int) -> FormStepContainer {
        self.order = order
        return self
    }
    
    @discardableResult
    public func icon(_ icon: String?) -> FormStepContainer {
        self.icon = icon
        return self
    }
    
    @discardableResult
    public func fields(@FormItemsBuilder _ fields: () -> [FormItemProtocol]) -> FormStepContainer {
        self.fields = fields().map { $0.erased() }
        return self
    }
}
