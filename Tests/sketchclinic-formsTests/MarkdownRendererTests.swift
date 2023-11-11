//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation
import XCTest
@testable import SketchClinicForms

class MarkdownRendererTests: XCTestCase {
    func testMarkdownRendering() throws {
        let form = FormContainer.opthalmology
        
        let renderer = MarkdownFormContainerRenderer()
        let output = try renderer.render(form: form)
        
        print(output)
    }
}

