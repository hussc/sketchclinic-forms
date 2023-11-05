//
//  FormContainerRenderer.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public protocol FormContainerRenderer {
    associatedtype Output
    
    func render(form: FormContainer) throws -> Output
}
