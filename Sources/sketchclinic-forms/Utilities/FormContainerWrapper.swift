//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 17/09/2023.
//

import Foundation

@propertyWrapper
public class FormContainerWrapper: Codable, Equatable, Hashable {
    public static func == (lhs: FormContainerWrapper, rhs: FormContainerWrapper) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
    
    public var wrappedValue: String? {
        didSet {
            rereadFormContainer()
        }
    }
    
    public private(set) var projectedValue: FormContainer?
    
    public init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue
        self.rereadFormContainer()
    }
    
    private func rereadFormContainer() {
        guard let wrappedValue else {
            projectedValue = nil
            return
        }
        
        guard let data = wrappedValue.data(using: .utf8) else {
            projectedValue = nil
            return
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            self.projectedValue = try decoder.decode(FormContainer.self, from: data)
        } catch {
            projectedValue = nil
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try? decoder.singleValueContainer()
        self.wrappedValue = try? container?.decode(String.self)
        self.rereadFormContainer()
    }
}

extension KeyedDecodingContainer {
    public func decode(_ type: FormContainerWrapper.Type, forKey key: K) throws -> FormContainerWrapper {
        if let value = try self.decodeIfPresent(type, forKey: key) {
            return value
        }
        
        return FormContainerWrapper(wrappedValue: nil)
    }
}
