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
    var includesFormTitle = false
    var includesStepTitle = false
    
    public init() { }
    
    public func render(form: FormContainer) throws -> String {
        let title = includesFormTitle ? "# \(form.title)" : ""
        let steps = form.steps.compactMap { step in
            let stepTitle = includesStepTitle ? "## \(step.title)\n" : "\n"
            let stepDescription = step.description.map { "> \($0)" }
            let fields: [String?] = step.fields.map { field in
                if let markdownField = field.item as? MarkdownRenderableFormItemProtocol {
                    return markdownField.markdownText
                }
                
                return nil
            }
            
            if fields.compactMap({ $0 }).isEmpty { return nil }
            
            return ([stepTitle, stepDescription] + fields.compactMap { $0 }).compactMap { $0 }.joined(separator: "\n")
        }.joined(separator: "\n")
        
        return title + "\n\n" + steps
    }
}

extension BooleanFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        var markdown = ""
        
        if value {
            markdown += "#### \(placeholder)\n> **Yes**"
        } else {
            markdown += "#### \(placeholder)\n> **No**"
        }
        
        return markdown
    }
}

extension DateFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        return "#### \(title): \n> **\(value.formatted(.dateTime))**"
    }
}

extension DescriptionFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        return nil
    }
}

extension LongTextFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return nil
        }
        
        var markdown = title.isEmpty ? "" : "#### \(title)\n"
        markdown += value
        return markdown
    }
}

extension TextFormItem: MarkdownRenderableFormItemProtocol {
    public var markdownText: String? {
        if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return nil
        }
        
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
        return title.isEmpty ? "" : "#### \(title):\n> **\(value)**"
    }
}
