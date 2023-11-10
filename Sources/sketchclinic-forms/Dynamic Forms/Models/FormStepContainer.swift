//
//  FormStepContainer.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

open class FormStepContainer: Codable, Equatable, Hashable, Identifiable {
    public var title: String
    public var description: String?
    public var icon: String?
    public var order: Int

    public var id: String { title + "\(order)" }

    @Published public var fields: [AnyFormItem]
    
    public static func == (lhs: FormStepContainer, rhs: FormStepContainer) -> Bool {
        lhs.title == rhs.title && lhs.description == rhs.description && lhs.icon == rhs.icon && lhs.order == rhs.order
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(icon)
        hasher.combine(order)
    }

    public init(title: String, description: String? = nil, icon: String? = nil, order: Int, fields: [FormItemProtocol]) {
        self.title = title
        self.description = description
        self.icon = icon
        self.order = order
        self.fields = fields.map { $0.erased() }
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.title = try container.decode(String.self, forKey: .title)
        self.order = try container.decode(Int.self, forKey: .order)

        // now here comes the tricky part, we need to decode the form items
        // first we want to iterate through the formItems, depending on the "type" key, we will decode the rest of the model
        // but how would we do that?
        self.fields = try container.decode([AnyFormItem].self, forKey: .fields)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fields, forKey: .fields)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(title, forKey: .title)
        try container.encode(order, forKey: .order)
        try container.encodeIfPresent(icon, forKey: .icon)
    }
}

extension FormStepContainer {
    public enum CodingKeys: String, CodingKey {
        case title
        case description
        case icon
        case order
        case fields
    }
}


#if canImport(SwiftUI)
import SwiftUI
import SketchClinicFoundation
extension FormStepContainer: ObservableObject { }
#endif
