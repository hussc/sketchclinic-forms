import XCTest
@testable import SketchClinicForms

final class SketchClinicFormsTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}

func constructSampleForm() -> FormContainer {
    let step1 = FormStepContainer(title: "First Step") {
        DescriptionFormItem(text: "> This is a description")
        
        TextFormItem(title: "Enter your name", placeholder: "Name")
        BooleanFormItem(placeholder: "Do you love me?")
    }
    
    let step2 = FormStepContainer(title: "Second Step"){
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

func constructStandardSampleForm() -> FormContainer {
    let declaimerStep = FormStepContainer(title: "Disclaimer") {
        DescriptionFormItem(text: "## Disclaimer\n> This form is just for testing purposes and doesn't reflect any real medical information, **obviously it was created by a programmer**")
    }
    
    let historyStep = FormStepContainer(title: "History") {
        BooleanFormItem(placeholder: "Do you have any allergies?")
        TextFormItem(title: "If you have, please specify", placeholder: "Allergies")
        LongTextFormItem(title: "Past surgeries or hospitalizations", placeholder: "")
        LongTextFormItem(title: "List of current medications", placeholder: "")
        MultipleChoicesFormItem(title: "Do you have any of the following chronic conditions?") {
            FormChoiceItem(title: "Hypertension")
            FormChoiceItem(title: "Diabetes")
            FormChoiceItem(title: "Asthma")
            FormChoiceItem(title: "Heart Disease")
        }
    }
    
    let reasonStep = FormStepContainer(title: "Visit Reason") {
        LongTextFormItem(title: "Primary reason for today's visit", placeholder: "")
        DateFormItem(title: "Date symptoms began")
        NumberFormItem(title: "Rate your pain from 1 to 10", placeholder: "Pain Rate", format: .integer)
    }
    
    let diagnoses = FormStepContainer(title: "Diagnoses") {
        LongTextFormItem(title: "Diagnoses", placeholder: "")
    }
    
    return FormContainer(id: "standard-mock-form", title: "Standard Form") {
        declaimerStep
        historyStep
        reasonStep
        diagnoses
    }
}
