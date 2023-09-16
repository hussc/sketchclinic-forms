//
//  FormContainer.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

open class FormContainer: ObservableObject, Identifiable, Codable {
    public var id: String
    public var version: String
    public var title: String
    
    @Published public var steps: [FormStepContainer]
    @Published public var editingStep: FormStepContainer
    
    public init(id: String, version: String, title: String, steps: [FormStepContainer]) {
        self.id = id
        self.version = version
        self.title = title
        self.steps = steps
        
        editingStep = steps.first ?? .emptyStepContainer
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.version = try container.decode(String.self, forKey: .version)
        self.title = try container.decode(String.self, forKey: .title)
        let steps = try container.decode([FormStepContainer].self, forKey: .steps)
        
        self.steps = steps
        self.editingStep = steps.first ?? .emptyStepContainer
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(version, forKey: .version)
        try container.encode(title, forKey: .title)
        try container.encode(steps, forKey: .steps)
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case version
        case title
        case steps
    }
}

extension FormContainer {
    public static var empty: FormContainer = .init(id: "none", version: "0.1", title: "Start here", steps: [])
}

extension FormStepContainer {
    public static var emptyStepContainer: FormStepContainer {
        .init(title: "Review", order: 1, fields: [
            DescriptionFormItem(title: "Notice", order: 1, value: "Nothing to submit here, the **mighty cat** who made this form decided that nothing to be written.\n\n > you can safetly submit ")
        ])
    }
}
