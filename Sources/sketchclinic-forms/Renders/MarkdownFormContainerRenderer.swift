//
//  MarkdownFormContainerRenderer.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

/**
 Renders the contents of the form to Markdown text.
 Note: Markdown text can't be read back once exported
 */
struct MarkdownFormContainerRenderer: FormContainerRenderer {
    func render(form: FormContainer) throws -> String {
        return "Markdown rendering is not implemented yet"
    }
}
