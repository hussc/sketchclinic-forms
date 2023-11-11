//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 07/11/2023.
//

import Foundation
import XCTest
@testable import SketchClinicForms

class OpthalmologyFormTests: XCTestCase {

    func testGenerationOfOpthalmologyForm() throws {
        let formContainer = FormContainer.opthalmology

        let encoder = JSONEncoder()
        let data = try encoder.encode(formContainer)

        let outputString = String(data: data, encoding: .utf8)
        print(try XCTUnwrap(outputString))

        let decodedBack = try JSONDecoder().decode(FormContainer.self, from: data)
        debugPrint(decodedBack)
    }
}
