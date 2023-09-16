//
//  AnyFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct AnyFormItem: Codable, Identifiable {
    public var item: FormItemProtocol
    
    public var id: String {
        item.id
    }
    
    public init(item: FormItemProtocol) {
        self.item = item
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeString = try container.decode(String.self, forKey: .type)
        
        guard let type = (FormItemsRegistry.items.first { $0.typeIdentifier == typeString }) else {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Invalid type-identifier \(typeString), the type wasn't found in the registry, available types: \(FormItemsRegistry.items.map { $0.typeIdentifier })")
        }
        
        self.item = try type.init(from: decoder)
    }
    
    public func encode(to encoder: Encoder) throws {
        try item.encode(to: encoder)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
    }
}

extension FormItemProtocol {
    public func erased() -> AnyFormItem {
        AnyFormItem(item: self)
    }
}
