//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 07/11/2023.
//

import Foundation

extension FormContainer {
    static var opthalmology: FormContainer {
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
            FormChoiceItem(title: "NO NVI"),
            FormChoiceItem(title: "Others")
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

        let subjectiveStep = FormStepContainer(title: "History") {
            LongTextFormItem(title: "Subjective", placeholder: "")
            DescriptionFormItem(text: "## Review of System")
            TextFormItem(title: "Constitutional", placeholder: "Constitutional")
            TextFormItem(title: "Respiratory", placeholder: "Constitutional")
            TextFormItem(title: "Cardiovascular", placeholder: "Constitutional")
            TextFormItem(title: "Gastrointestinal", placeholder: "Gastrointestinal")
            TextFormItem(title: "Musculoskeletal", placeholder: "Musculoskeletal")
            TextFormItem(title: "Neurologic", placeholder: "Neurologic")
            LongTextFormItem(title: "Objective", placeholder: "")
        }

        let rightEye = FormStepContainer(title: "Exam Right Eye") {

            // from 6 to 60 (step 1, trailing to leading)
            NumberFormItem(title: "Visual Acuity", placeholder: "6 / ", format: .integer)
            NumberFormItem(title: "Pin Hole", placeholder: "6 / ", format: .integer)

            TextFormItem(title: "Glasses", placeholder: "Glasses")
            TextFormItem(title: "Refraction", placeholder: "Refraction")

            // from 0 to 71
            NumberFormItem(title: "IOP", placeholder: "IOP Number in mmhg", format: .integer)


            // Eyelid
            MultipleChoicesFormItem(title: "Eyelid", choices: eyeLid)

            TextFormItem(title: "Eyelid (if Other)", placeholder: "Other choice")

            MultipleChoicesFormItem(title: "Lacrimal", choices: lacrimal)
            TextFormItem(title: "Lacrimal (if Other)", placeholder: "Other choice")

            // Conjunctiva
            MultipleChoicesFormItem(title: "Conjunctiva, sclera", choices: conjunctivaSclera)
            TextFormItem(title: "Conjuctiva (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "Cornea", choices: cornea)
            TextFormItem(title: "Cornea (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "AC", choices: AC)
            TextFormItem(title: "AC (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "Iris", choices: iris)
            TextFormItem(title: "Iris (if Other)", placeholder: "Other choice")

            MultipleChoicesFormItem(title: "Pupil", choices: pupil)
            TextFormItem(title: "Pupil (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "Lens", choices: lens)
            TextFormItem(title: "Lens (if Other)", placeholder: "Other choice")

            MultipleChoicesFormItem(title: "Ocular Motility", choices: ocularMotility)
            TextFormItem(title: "Ocular (if Other)", placeholder: "Other choice")

            TextFormItem(title: "Fundus", placeholder: "Right Eye")

            LongTextFormItem(title: "Lab Results", placeholder: "Lab Results")
            LongTextFormItem(title: "Assessment And Plan", placeholder: "Assembly And Plan")
        }

        let leftEye = FormStepContainer(title: "Left Eye") {

            // from 6 to 60 (step 1, trailing to leading)
            NumberFormItem(title: "Visual Acuity", placeholder: "6 / ", format: .integer)
            NumberFormItem(title: "Pin Hole", placeholder: "6 / ", format: .integer)

            TextFormItem(title: "Glasses", placeholder: "Glasses")
            TextFormItem(title: "Refraction", placeholder: "Refraction")

            // from 0 to 71
            NumberFormItem(title: "IOP", placeholder: "IOP Number in mmhg", format: .integer)


            // Eyelid
            MultipleChoicesFormItem(title: "Eyelid", choices: eyeLid)

            TextFormItem(title: "Eyelid (if Other)", placeholder: "Other choice")

            // Conjunctiva
            MultipleChoicesFormItem(title: "Conjunctiva, sclera", choices: conjunctivaSclera)
            TextFormItem(title: "Conjuctiva (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "Cornea", choices: cornea)
            TextFormItem(title: "Cornea (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "AC", choices: AC)
            TextFormItem(title: "AC (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "Iris", choices: iris)
            TextFormItem(title: "Iris (if Other)", placeholder: "Other choice")

            MultipleChoicesFormItem(title: "Pupil", choices: pupil)
            TextFormItem(title: "Pupil (if Other)", placeholder: "Other choice")


            MultipleChoicesFormItem(title: "Lens", choices: lens)
            TextFormItem(title: "Lens (if Other)", placeholder: "Other choice")

            MultipleChoicesFormItem(title: "Ocular Motility", choices: ocularMotility)
            TextFormItem(title: "Ocular (if Other)", placeholder: "Other choice")

            TextFormItem(title: "Fundus", placeholder: "Right Eye")

            LongTextFormItem(title: "Lab Results", placeholder: "Lab Results")
            LongTextFormItem(title: "Assessment And Plan", placeholder: "Assembly And Plan")
        }

        return FormContainer(id: "ophthalmology-diagnosis", title: "Eye Examination") {
            subjectiveStep
            rightEye
            leftEye
        }
    }
}
