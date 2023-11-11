import Foundation
import XCTest
@testable import SketchClinicForms

final class JSONRendererTests: XCTestCase {
    func testJSONRendering() throws {
        let form = FormContainer.opthalmology
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(form)
        
        let outputString = String(data: data, encoding: .utf8)
        print(try XCTUnwrap(outputString))
        
        let decodedBack = try JSONDecoder().decode(FormContainer.self, from: data)
        debugPrint(decodedBack)
    }
}

