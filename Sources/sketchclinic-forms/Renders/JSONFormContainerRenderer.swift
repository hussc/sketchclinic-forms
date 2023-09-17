//
//  JSONFormContainerRenderer.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public struct JSONFormContainerRenderer: FormContainerRenderer {
    public init() { }
    
    public func render(form: FormContainer) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        return try encoder.encode(form)
    }
}
