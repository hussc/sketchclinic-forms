//
//  MarkdownDefaultStyle.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 14/09/2023.
//

import SwiftUI
import MarkdownUI

extension FontProperties.Family {
    public static var ibmPlex: FontProperties.Family {
        .custom("IBMPlexSansArabic-Regular")
    }
}

extension Theme {
    public static let defaultTheme = Theme()
        .text {
            ForegroundColor(.textPrimary)
            FontWeight(.regular)
            FontFamily(.ibmPlex)
            FontSize(17)
        }
        .strong {
            FontWeight(.bold)
        }
        .link {
            FontFamily(.ibmPlex)
            FontWeight(.regular)
            ForegroundColor(.accentColor)
        }
        .heading1 { configuration in
            configuration.label
                .relativePadding(.bottom, length: .em(0.3))
                .relativeLineSpacing(.em(0.125))
                .markdownMargin(top: 24, bottom: 16)
                .markdownTextStyle {
                    FontFamily(.ibmPlex)
                    FontSize(24)
                    FontWeight(.semibold)
                    FontSize(.em(2))
                }
        }
        .heading2 { configuration in
            VStack(alignment: .leading, spacing: 0) {
                configuration.label
                    .relativeLineSpacing(.em(0.125))
                    .markdownMargin(top: Paddings.medium, bottom: Paddings.medium)
                    .markdownTextStyle {
                        FontFamily(.ibmPlex)
                        FontWeight(.semibold)
                        FontSize(20)
                    }
            }
            .padding(Paddings.smallX)
            .background {
                RoundedRectangle(cornerRadius: 6).fill(Color.backgroundSecondary)
            }
        }
        .heading3 { configuration in
            configuration.label
                .markdownMargin(top: Paddings.smallX, bottom: 4)
                .markdownTextStyle {
                    FontFamily(.ibmPlex)
                    FontWeight(.semibold)
                    FontSize(17)
                }
        }
        .heading4 { configuration in
            configuration.label
                .markdownMargin(top: Paddings.smallX, bottom: Paddings.smallX)
                .markdownTextStyle {
                    FontFamily(.ibmPlex)
                    FontWeight(.semibold)
                }
        }
        .heading5 { configuration in
            configuration.label
                .markdownMargin(top: Paddings.smallX, bottom: Paddings.smallX)
                .markdownTextStyle {
                    FontFamily(.ibmPlex)
                    FontWeight(.semibold)
                    FontSize(.em(0.875))
                }
        }
        .heading6 { configuration in
            configuration.label
                .markdownMargin(top: Paddings.smallX, bottom: Paddings.smallX)
                .markdownTextStyle {
                    FontFamily(.ibmPlex)
                    FontWeight(.semibold)
                    FontSize(.em(0.85))
                    ForegroundColor(.textSecondary)
                }
        }
        .paragraph { configuration in
            configuration.label
                .fixedSize(horizontal: false, vertical: true)
                .markdownTextStyle {
                    ForegroundColor(.textPrimary)
                    FontWeight(.regular)
                    FontFamily(.ibmPlex)
                    FontSize(17)
                }
        }
        .blockquote { configuration in
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.customBorder)
                    .relativeFrame(width: .em(0.2))
                configuration.label
                    .markdownTextStyle { 
                        FontWeight(.medium)
                        FontFamily(.ibmPlex)
                        FontSize(13)
                        ForegroundColor(.textSecondary)
                    }
                    .relativePadding(.horizontal, length: .em(0.5))
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .listItem { configuration in
            configuration.label
                .markdownMargin(top: .em(0.25))
        }
        .taskListMarker { configuration in
            Image(systemName: configuration.isCompleted ? "checkmark.square.fill" : "square")
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color.accentColor, Color.customBorder)
                .imageScale(.small)
                .relativeFrame(minWidth: .em(1.5), alignment: .trailing)
        }
}
