//
//  FormItemsBuilder.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

@resultBuilder
public struct FormItemsBuilder {
    
    // For single items
    public static func buildExpression(_ item: FormItemProtocol) -> FormItemProtocol {
        return item
    }
    
    // For groups of items
    public static func buildBlock(_ items: FormItemProtocol...) -> [FormItemProtocol] {
        for (index, item) in items.enumerated() {
            var mutableItem = item
            mutableItem.order = index + 1
        }
        
        return items
    }
    
    // For optional items
    public static func buildOptional(_ item: FormItemProtocol?) -> FormItemProtocol? {
        return item
    }
    
    // For conditional items
    public static func buildEither(first: FormItemProtocol) -> FormItemProtocol {
        return first
    }
    
    public static func buildEither(second: FormItemProtocol) -> FormItemProtocol {
        return second
    }
    
    // For arrays of items
    public static func buildArray(_ components: [FormItemProtocol]) -> [FormItemProtocol] {
        for (index, item) in components.enumerated() {
            var mutableItem = item
            mutableItem.order = index + 1
        }
        return components
    }
    
    // For final result conversion, in this case, we'll just return the items as-is
    public static func buildFinalResult(_ component: [FormItemProtocol]) -> [FormItemProtocol] {
        return component
    }
    
    public static func buildOptional(_ component: [FormItemProtocol]?) -> [FormItemProtocol] {
        return component ?? []
    }
    
    public static func buildEither(first component: [FormItemProtocol]) -> [FormItemProtocol] {
        return component
    }
    
    public static func buildEither(second component: [FormItemProtocol]) -> [FormItemProtocol] {
        return component
    
    }
}

extension FormItemProtocol {
    public func order(_ order: Int) -> Self {
        var intermediate = self
        intermediate.order = order
        return intermediate
    }
    
    public func title(_ title: String) -> Self {
        var intermediate = self
        intermediate.title = title
        return intermediate
    }
}
