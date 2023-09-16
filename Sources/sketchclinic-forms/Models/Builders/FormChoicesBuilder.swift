//
//  FormChoicesBuilder.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

@resultBuilder
public struct FormChoicesBuilder {
    
    // For single items
    public static func buildExpression(_ item: FormChoiceItem) -> FormChoiceItem {
        return item
    }
    
    // For groups of items
    public static func buildBlock(_ items: FormChoiceItem...) -> [FormChoiceItem] {
        for (index, item) in items.enumerated() {
            var mutableItem = item
            mutableItem.order = index + 1
        }
        
        return items
    }
    
    // For optional items
    public static func buildOptional(_ item: FormChoiceItem?) -> FormChoiceItem? {
        return item
    }
    
    // For conditional items
    public static func buildEither(first: FormChoiceItem) -> FormChoiceItem {
        return first
    }
    
    public static func buildEither(second: FormChoiceItem) -> FormChoiceItem {
        return second
    }
    
    // For arrays of items
    public static func buildArray(_ components: [FormChoiceItem]) -> [FormChoiceItem] {
        for (index, item) in components.enumerated() {
            var mutableItem = item
            mutableItem.order = index + 1
        }
        
        return components
    }
    
    // For final result conversion
    public static func buildFinalResult(_ component: [FormChoiceItem]) -> [FormChoiceItem] {
        return component
    }
}

extension FormChoiceItem {
    public func order(_ order: Int) -> FormChoiceItem {
        FormChoiceItem(title: title, order: order)
    }
    
    public func title(_ title: String) -> FormChoiceItem {
        FormChoiceItem(title: title, order: order)
    }
}
