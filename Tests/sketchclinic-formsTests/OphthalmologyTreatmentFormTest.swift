import XCTest
@testable import SketchClinicForms

final class OphthalmologyTreatmentFormTest: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
let visualAcuity = [
    FormChoiceItem(title: "6/6"),
    FormChoiceItem(title: "6/8"),
    FormChoiceItem(title: "6/9"),
    FormChoiceItem(title: "6/12"),
    FormChoiceItem(title: "6/12"),
    FormChoiceItem(title: "6/15"),
    FormChoiceItem(title: "6/18"),
    FormChoiceItem(title: "6/24"),
    FormChoiceItem(title: "6/30"),
    FormChoiceItem(title: "6/36"),
    FormChoiceItem(title: "6/48"),
    FormChoiceItem(title: "6/60")

]
let iob = [  
    FormChoiceItem(title: "Normal"),
    FormChoiceItem(title: "1mmhg"),
    FormChoiceItem(title: "2mmhg"),
    FormChoiceItem(title: "3mmhg"),
    FormChoiceItem(title: "4mmhg"),
    FormChoiceItem(title: "5mmhg"),
    FormChoiceItem(title: "6mmhg"),
    FormChoiceItem(title: "7mmhg"),
    FormChoiceItem(title: "8mmhg"),
    FormChoiceItem(title: "9mmhg"),
    FormChoiceItem(title: "10mmhg"),
    FormChoiceItem(title: "11mmhg"),
    FormChoiceItem(title: "12mmhg"),
    FormChoiceItem(title: "13mmhg"),
    FormChoiceItem(title: "14mmhg"),
    FormChoiceItem(title: "15mmhg"),
    FormChoiceItem(title: "16mmhg"),
    FormChoiceItem(title: "17mmhg"),
    FormChoiceItem(title: "18mmhg"),
    FormChoiceItem(title: "19mmhg"),
    FormChoiceItem(title: "20mmhg"),
    FormChoiceItem(title: "21mmhg"),
    FormChoiceItem(title: "22mmhg"),
    FormChoiceItem(title: "23mmhg"),
    FormChoiceItem(title: "24mmhg"),
    FormChoiceItem(title: "25mmhg"),
    FormChoiceItem(title: "26mmhg"),
    FormChoiceItem(title: "27mmhg"),
    FormChoiceItem(title: "28mmhg"),
    FormChoiceItem(title: "29mmhg"),
    FormChoiceItem(title: "30mmhg"),
    FormChoiceItem(title: "31mmhg"),
    FormChoiceItem(title: "32mmhg"),
    FormChoiceItem(title: "33mmhg"),
    FormChoiceItem(title: "34mmhg"),
    FormChoiceItem(title: "35mmhg"),
    FormChoiceItem(title: "36mmhg"),
    FormChoiceItem(title: "37mmhg"),
    FormChoiceItem(title: "38mmhg"),
    FormChoiceItem(title: "39mmhg"),
    FormChoiceItem(title: "40mmhg"),
    FormChoiceItem(title: "41mmhg"),
    FormChoiceItem(title: "42mmhg"),
    FormChoiceItem(title: "43mmhg"),
    FormChoiceItem(title: "44mmhg"),
    FormChoiceItem(title: "45mmhg"),
    FormChoiceItem(title: "46mmhg"),
    FormChoiceItem(title: "47mmhg"),
    FormChoiceItem(title: "48mmhg"),
    FormChoiceItem(title: "49mmhg"),
    FormChoiceItem(title: "50mmhg"),
    FormChoiceItem(title: "51mmhg"),
    FormChoiceItem(title: "52mmhg"),
    FormChoiceItem(title: "53mmhg"),
    FormChoiceItem(title: "54mmhg"),
    FormChoiceItem(title: "55mmhg"),
    FormChoiceItem(title: "56mmhg"),
    FormChoiceItem(title: "57mmhg"),
    FormChoiceItem(title: "58mmhg"),
    FormChoiceItem(title: "59mmhg"),
    FormChoiceItem(title: "60mmhg"),
    FormChoiceItem(title: "61mmhg"),
    FormChoiceItem(title: "62mmhg"),
    FormChoiceItem(title: "63mmhg"),
    FormChoiceItem(title: "64mmhg"),
    FormChoiceItem(title: "65mmhg"),
    FormChoiceItem(title: "66mmhg"),
    FormChoiceItem(title: "67mmhg"),
    FormChoiceItem(title: "68mmhg"),
    FormChoiceItem(title: "69mmhg"),
    FormChoiceItem(title: "70mmhg")
]
let eyeLid = [
    FormChoiceItem(title: "Normal"),
    FormChoiceItem(title: "Blepharitis"),
    FormChoiceItem(title: "Chalazion"),
    FormChoiceItem(title: "Hordeolum"),
    FormChoiceItem(title: "Seborrheic Keratosis"),
    FormChoiceItem(title: "Actinic Keratosis"),
    FormChoiceItem(title: "Nevus"),
    FormChoiceItem(title: "Xanthelasma"),
    FormChoiceItem(title: "Molluscum Contagiosum"),
    FormChoiceItem(title: "Hydrocystoma"),
    FormChoiceItem(title: "Basal Cell Carcinoma"),
    FormChoiceItem(title: "Squamous Cell Carcinoma"),
    FormChoiceItem(title: "Sebaceous Carcinoma"),
    FormChoiceItem(title: "Melanoma"),
    FormChoiceItem(title: "Entropion"),
    FormChoiceItem(title: "Ectropion"),
    FormChoiceItem(title: "Trichiasis"),
    FormChoiceItem(title: "Dermatochalasis"),
    FormChoiceItem(title: "Blepharoptosis"),
    FormChoiceItem(title: "Eyelid Retraction"),
    FormChoiceItem(title: "Facial Palsy"),
    FormChoiceItem(title: "Blepharospasm"),
    FormChoiceItem(title: "Others")
]
let lacrimal = [
    FormChoiceItem(title: "Normal"),
    FormChoiceItem(title: "Excessive tearing"),
    FormChoiceItem(title: "Redness of the white part of the eye"),
    FormChoiceItem(title: "Recurrent eye infection or inflammation (pink eye)"),
    FormChoiceItem(title: "Painful swelling near the inside corner of the eye"),
    FormChoiceItem(title: "Crusting of the eyelids"),
    FormChoiceItem(title: "Mucus or pus discharge from the lids and surface of the eye"),
    FormChoiceItem(title: "Blurred vision"),
    FormChoiceItem(title: "Dry Eye Syndrome"),
    FormChoiceItem(title: "Discomfort in the region of the tear ducts"),
    FormChoiceItem(title: "Dry eyes"),
    FormChoiceItem(title: "Excessive discharge or tearing"),
    FormChoiceItem(title: "Inflammation of the outer portion of the upper lid"),
    FormChoiceItem(title: "Tenderness and redness of the outer portion of the upper lid"),
    FormChoiceItem(title: "Inflammation of lymph nodes in front of the ear"),
    FormChoiceItem(title: "Pain in the area of inflammation"),
    FormChoiceItem(title: "Others")
]
let conjunctivaSclera = [ 
    FormChoiceItem(title: "(Empty)"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Hyperemic"),
    FormChoiceItem(title: "Episcleritis"),
    FormChoiceItem(title: "Infectious Conjunctivitis"),
    FormChoiceItem(title: "Ocular Mucous Membrane Pemphigoid"),
    FormChoiceItem(title: "Pinguecula and Pterygium"),
    FormChoiceItem(title: "Scleritis"),
    FormChoiceItem(title: "Subconjunctival Hemorrhage"),
    FormChoiceItem(title: "Trachoma"),
    FormChoiceItem(title: "Acute Bacterial Conjunctivitis"),
    FormChoiceItem(title: "Adult Inclusion Conjunctivitis"),
    FormChoiceItem(title: "Allergic Conjunctivitis"),
    FormChoiceItem(title: "Viral Conjunctivitis"),
    FormChoiceItem(title: "Others")
]
let cornea = [     
    FormChoiceItem(title: "(Empty)"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Infections"),
    FormChoiceItem(title: "Trauma"),
    FormChoiceItem(title: "Dystrophies and degenerative corneal disorders"),
    FormChoiceItem(title: "Nutritional deficiencies"),
    FormChoiceItem(title: "Allergies"),
    FormChoiceItem(title: "Growths"),
    FormChoiceItem(title: "Ectasia (thinning)"),
    FormChoiceItem(title: "SJ syndrome"),
    FormChoiceItem(title: "Herpetic stromal keratitis"),
    FormChoiceItem(title: "Corneal Ulcer"),
    FormChoiceItem(title: "Others")
]
let AC = [        
    FormChoiceItem(title: "(Empty)"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Quiet"),
    FormChoiceItem(title: "Aniridia"),
    FormChoiceItem(title: "Open angle"),
    FormChoiceItem(title: "Narrow"),
    FormChoiceItem(title: "Blocking"),
    FormChoiceItem(title: "Shallow anterior chamber"),
    FormChoiceItem(title: "Grade 1"),
    FormChoiceItem(title: "Grade 11"),
    FormChoiceItem(title: "Grade 111"),
    FormChoiceItem(title: "Grade. 1111"),
    FormChoiceItem(title: "Tyndall 1"),
    FormChoiceItem(title: "Tyndall  11"),
    FormChoiceItem(title: "Tyndall. 111"),
    FormChoiceItem(title: "Tyndall 1111"),
    FormChoiceItem(title: "Hyphema"),
    FormChoiceItem(title: "Hypopyon"),
    FormChoiceItem(title: "White blood cells"),
    FormChoiceItem(title: "Flare (particles of protein) in the aqueous Posterior"),
    FormChoiceItem(title: "Others")
]
let iris = [   
    FormChoiceItem(title: "Normal"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Iritis"),
    FormChoiceItem(title: "Iridocyclitis"),
    FormChoiceItem(title: "Uveitis"),
    FormChoiceItem(title: "Small"),
    FormChoiceItem(title: "Iregularly shaped"),
    FormChoiceItem(title: "Embryotoxon"),
    FormChoiceItem(title: "Iris ectropion with Lisch nodules"),
    FormChoiceItem(title: "Aniridia"),
    FormChoiceItem(title: "Anisocoria, Congenital"),
    FormChoiceItem(title: "Atresia of pupil"),
    FormChoiceItem(title: "Coloboma of iris"),
    FormChoiceItem(title: "Corectopia"),
    FormChoiceItem(title: "Rubeosis"),
    FormChoiceItem(title: "NVI"),
    FormChoiceItem(title: "Others"),
    FormChoiceItem(title: "NO NVI")
]
let pupil = [  
    FormChoiceItem(title: "(Empty)"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Normal"),
    FormChoiceItem(title: "RRR"),
    FormChoiceItem(title: "Anisocoria"),
    FormChoiceItem(title: "Adie's pupil"),
    FormChoiceItem(title: "Uvietis with synaechiae"),
    FormChoiceItem(title: "Horner's syndrome."),
    FormChoiceItem(title: "Anomalies of pupillary reflexes (Marcus-gunn pupil / RAPD / pupillary escape phenomenon)"),
    FormChoiceItem(title: "Adie's (Tonic)"),
    FormChoiceItem(title: "Argyll Robertson"),
    FormChoiceItem(title: "Horner's Syndrome"),
    FormChoiceItem(title: "Others")
]
let lens = [
    FormChoiceItem(title: "(Empty)"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Congenital Cataracts"),
    FormChoiceItem(title: "Nuclear sclerosis grade 1"),
    FormChoiceItem(title: "Nuclear sclerosis grade 11"),
    FormChoiceItem(title: "Nuclear sclerosis grade 111"),
    FormChoiceItem(title: "Cataract cortical"),
    FormChoiceItem(title: "Cataract nuclear"),
    FormChoiceItem(title: "Cataract posterior"),
    FormChoiceItem(title: "Catract subcapsular"),
    FormChoiceItem(title: "Pseudophakia"),
    FormChoiceItem(title: "Aphakia"),
    FormChoiceItem(title: "Posterior Subcapsular Cataracts"),
    FormChoiceItem(title: "Others")
]
let ocularMotility = [
    FormChoiceItem(title: "(Empty)"),
    FormChoiceItem(title: "Clear"),
    FormChoiceItem(title: "Strabismus"),
    FormChoiceItem(title: "Amblyopia"),
    FormChoiceItem(title: "Nystagmus"),
    FormChoiceItem(title: "Heterotropia"),
    FormChoiceItem(title: "Others"),
    FormChoiceItem(title: "Full")
]
// what I am trying to do is after the doctor is being presented with multible diagnostic list he can pick one or many THEN he has a checkbox whare he can choose if the problem applies for one eye or both eyes. the only two fields that needs inputs twice for both eyes are visual acuity and iob
func ophtholmologyFormTest() -> FormContainer {
    let RightEyeStep = FormStepContainer(title: "Right Eye") {
        SingleChoiceFormItem(title: "Visual Acuity", order: 1, choices: visualAcuity)
        BooleanFormItem(title: "with pinhole", placeholder: "with pinhole")
        TextFormItem(title: "Glasses", placeholder: "Right Eye")
        TextFormItem(title: "Refraction", placeholder: "Right Eye")
        SingleChoiceFormItem(title: "IOB RE", order: 1, choices: iob)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Eyelid right Eye", order: 2, choices: eyeLid)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Conjunctiva right Eye", order: 3, choices: conjunctivaSclera)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Cornea right Eye", order: 4, choices: cornea)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "AC right Eye", order: 5, choices: AC)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Iris right Eye", order: 6, choices: iris)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Pupil right Eye", order: 7, choices: pupil)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Lens right Eye", order: 8, choices: lens)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        MultipleChoicesFormItem(title: "Ocular Motility right Eye", order: 9, choices: ocularMotility)
        BooleanFormItem(title: "right Eye", placeholder: "Right Eye")
        BooleanFormItem(title: "Left Eye", placeholder: "Left Eye")
        TextFormItem(title: "Fundus", placeholder: "Right Eye")
        LongTextFormItem(title: "Remarks", placeholder: "Right Eye")
        LongTextFormItem(title: "Assembly And Plan", placeholder: "Assembly And Plan")
    }
    let leftEye = FormStepContainer(title: "Left Eye") {
        SingleChoiceFormItem(title: "Visual Acuity", order: 2, choices: visualAcuity)
        SingleChoiceFormItem(title: "IOB RE", order: 1, choices: iob)
    }
    return FormContainer(id: "ophthalmology-diagnosis", title: "Eye Examination") {
        RightEyeStep
        leftEye
    }
}
