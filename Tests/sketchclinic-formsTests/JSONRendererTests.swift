import Foundation
import XCTest
@testable import SketchClinicForms

final class JSONRendererTests: XCTestCase {
    func testJSONRendering() throws {
        let form = constructSampleForm()
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(form)
        
        let outputString = String(data: data, encoding: .utf8)
        print(try XCTUnwrap(outputString))
        
        let decodedBack = try JSONDecoder().decode(FormContainer.self, from: data)
        debugPrint(decodedBack)
    }
}

extension JSONRendererTests {
    func constructSampleForm() -> FormContainer {
        let step1 = FormStepContainer(title: "Step 1") {
            DescriptionFormItem(text: "This is a description")
            
            TextFormItem(title: "Enter your name", placeholder: "Name")
            BooleanFormItem(placeholder: "Do you love me?")
        }
        
        let step2 = FormStepContainer(title: "Step 1"){
            DescriptionFormItem(text: "This is a description")
            
            BooleanFormItem(placeholder: "Do you love me?")
            NumberFormItem(title: "Enter your age", placeholder: "Age", format: .integer)
            
            MultipleChoicesFormItem(title: "Pick one of tehse") {
                FormChoiceItem(title: "Hussein")
                FormChoiceItem(title: "Hussein 2")
                FormChoiceItem(title: "Hussein 3")
            }
        }
        
        return FormContainer(id: "mock-form", title: "Mock Form") {
            step1
            step2
        }
    }
}
