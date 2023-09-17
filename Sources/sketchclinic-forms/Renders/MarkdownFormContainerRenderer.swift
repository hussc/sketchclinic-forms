//
//  MarkdownFormContainerRenderer.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public protocol MarkdownRenderableFormItemProtocol: FormItemProtocol {
    var markdownText: String? { get }
}

/**
 Renders the contents of the form to Markdown text.
 Note: Markdown text can't be read back once exported
 */
public struct MarkdownFormContainerRenderer: FormContainerRenderer {
    public func render(form: FormContainer) throws -> String {
        // Form Title -> # Form Title
        // Form Steps -> ## Step Title
        // Form Step Description -> > Step Description
        // Form Step Items -> ForEach:
            // ### Item Title
            // > Step Description (if found)
            // Each item renders on it's own format
            // if not, we will just skip the step :)
        let title = "# \(form.title)"
        let steps = form.steps.map { step in
            let stepTitle = "## \(step.title)\n"
            let stepDescription = step.description.map { "> \($0)" }
            let fields: [String?] = step.fields.map { field in
                if let markdownField = field.item as? MarkdownRenderableFormItemProtocol {
                    return markdownField.markdownText
                }
                
                return nil
            }
            
            return ([stepTitle, stepDescription] + fields.compactMap { $0 }).compactMap { $0 }.joined(separator: "\n")
        }.joined(separator: "\n")
        
        return title + "\n\n" + steps
    }
}

extension BooleanFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        var markdown = title.isEmpty ? "" : "#### \(title)\n"
        
        if value {
            markdown += "- [x] \(placeholder)"
        } else {
            markdown += "- [ ] \(placeholder)"
        }
        
        return markdown
    }
}

extension DateFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        return "#### \(title): \(value.formatted(.dateTime))"
    }
}

extension DescriptionFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        var markdown = title.isEmpty ? "" : "#### \(title)\n"
        markdown += value
        return markdown
    }
}

extension LongTextFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        var markdown = title.isEmpty ? "" : "#### \(title)\n"
        markdown += value
        return markdown
    }
}

extension TextFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        var markdown = title.isEmpty ? "" : "#### \(title)\n"
        markdown += value
        return markdown
    }
}

extension MultipleChoicesFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        guard !value.isEmpty else { return nil }
        var markdown = "#### \(title)\n"
        markdown += value.map { "- [x] \($0.title)" }.joined(separator: "\n")
        return markdown
    }
}

extension SingleChoiceFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        guard let value else { return nil }
        
        return "#### \(title)\n- [x] \(value.title)"
    }
}

extension NumberFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        return title.isEmpty ? "" : "#### \(title): **\(value)**"
    }
}
