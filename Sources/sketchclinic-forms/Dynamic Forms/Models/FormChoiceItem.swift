//
//  FormChoiceItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct FormChoiceItem: Identifiable, Codable, Hashable {
    public var title: String
    public var order: Int

    public var id: String { title }
    
    public init(title: String, order: Int = 0) {
        self.title = title
        self.order = order
    }
}
