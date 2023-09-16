//
//  FormContainerBuilder.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

extension FormContainer {
    public convenience init(id: String) {
        self.init(id: id, version: "", title: "", steps: [])
    }
    
    public func title(_ title: String) -> FormContainer {
        self.title = title
        return self
    }
    
    public func version(_ version: String) -> FormContainer {
        self.version = version
        return self
    }
    
    public func steps(@FormStepContainerBuilder _ steps: () -> [FormStepContainer]) -> FormContainer {
        self.steps = steps()
        return self
    }
    
    public func id(_ id: String) -> FormContainer {
        self.id = id
        return self
    }
}
