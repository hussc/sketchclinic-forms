//
//  MarkdownVisitNotesStyle.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 17/09/2023.
//

import Foundation
import SwiftUI
import MarkdownUI

extension Theme {
    public static func visitNotesTheme(for color: Color) -> Theme {
        return Theme()
            .text {
                ForegroundColor(color)
                FontWeight(.regular)
                FontFamily(.ibmPlex)
                FontSize(17)
            }
            .code {
                FontFamily(.ibmPlex)
                FontSize(.em(0.85))
                BackgroundColor(.backgroundSecondary)
            }
            .strong {
                FontWeight(.semibold)
                ForegroundColor(color)
            }
            .link {
                FontWeight(.semibold)
                ForegroundColor(color)
            }
            .image { configuration in
                configuration.label
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.vertical, Paddings.smallX)
            }
            .heading1 { configuration in
                HStack {
                    configuration.label
                        .relativePadding(.bottom, length: .em(0.3))
                        .relativeLineSpacing(.em(0.125))
                        .markdownMargin(top: Paddings.medium, bottom: Paddings.medium)
                        .markdownTextStyle {
                            FontFamily(.ibmPlex)
                            FontSize(22)
                            FontWeight(.semibold)
                            ForegroundColor(.textPrimary)
                        }
                    Spacer()
                }
                .padding(.vertical, Paddings.smallX)
                .background {
                    RoundedRectangle(cornerRadius: 6).fill(Color.backgroundSecondary)
                }
            }
            .heading2 { configuration in
                HStack {
                    configuration.label
                        .markdownTextStyle {
                            FontFamily(.ibmPlex)
                            FontWeight(.semibold)
                            FontSize(20)
                            ForegroundColor(.textPrimary)
                        }
                    Spacer()
                }
                .padding(.vertical, Paddings.smallX)
                .background {
                    RoundedRectangle(cornerRadius: 6).fill(Color.backgroundSecondary)
                }
                .padding(.vertical, Paddings.smallX)
            }
            .heading3 { configuration in
                HStack {
                    configuration.label
                        .markdownMargin(top: Paddings.smallX, bottom: 4)
                        .markdownTextStyle {
                            FontFamily(.ibmPlex)
                            FontWeight(.bold)
                            FontSize(17)
                            ForegroundColor(.textPrimary)
                        }
                    Spacer()
                }
                .padding(.vertical, Paddings.small)
            }
            .heading4 { configuration in
                configuration.label
                    .markdownMargin(top: Paddings.smallX, bottom: Paddings.smallX)
                    .markdownTextStyle {
                        FontFamily(.ibmPlex)
                        FontWeight(.semibold)
                        ForegroundColor(.textPrimary)
                    }
            }
            .heading5 { configuration in
                configuration.label
                    .markdownMargin(top: Paddings.smallX, bottom: Paddings.smallX)
                    .markdownTextStyle {
                        FontFamily(.ibmPlex)
                        FontWeight(.semibold)
                        FontSize(.em(0.875))
                        ForegroundColor(.textPrimary)
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
                HStack {
                    configuration.label
                        .markdownTextStyle {
                            ForegroundColor(color)
                            FontWeight(.regular)
                            FontFamily(.ibmPlex)
                            FontSize(17)
                        }
                    Spacer()
                }
            }
            .blockquote { configuration in
                HStack(spacing: 0) {
                    configuration.label
                        .fixedSize(horizontal: false, vertical: true)
                        .markdownTextStyle {
                            FontWeight(.medium)
                            FontFamily(.ibmPlex)
                            FontSize(17)
                            ForegroundColor(.textPrimary)
                        }
                    Spacer()
                }
            }
            .codeBlock { configuration in
                HStack {
                    configuration.label
                        .relativeLineSpacing(.em(0.225))
                        .markdownTextStyle {
                            FontWeight(.medium)
                            FontFamily(.ibmPlex)
                            FontSize(17)
                            ForegroundColor(.textPrimary)
                        }
                        .foregroundColor(color)
                    Spacer()
                }
                .background(Color.backgroundSecondary)
                .markdownMargin(top: 0, bottom: Paddings.smallX)
            }
            .listItem { configuration in
                configuration.label
                    .markdownTextStyle {
                        FontWeight(.medium)
                        FontFamily(.ibmPlex)
                        FontSize(17)
                        ForegroundColor(color)
                    }
                    .markdownMargin(top: .em(0.3))
            }
            .bulletedListMarker(body: { configuration in
                Image(systemName: "circle.fill")
                    .font(.system(size: 8))
                    .foregroundColor(color)
            })
            .taskListMarker { configuration in
                Image(systemName: configuration.isCompleted ? "checkmark.square.fill" : "square")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(color, Color.customBorder)
                    .font(.system(size: 18, weight: .semibold))
            }
            .table { configuration in
                configuration.label
                    .fixedSize(horizontal: false, vertical: true)
                    .markdownTableBorderStyle(.init(color: Color.customBorder, width: 1))
                    .markdownTableBackgroundStyle(
                        .alternatingRows(Color.backgroundPrimary, Color.backgroundSecondary)
                    )
                    .markdownMargin(top: 0, bottom: Paddings.smallX)
                    .padding(.vertical, Paddings.smallX)
            }
            .tableCell { configuration in
                configuration.label
                    .markdownTextStyle {
                        if configuration.row == 0 {
                            FontWeight(.semibold)
                        }
                        BackgroundColor(nil)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, Paddings.small)
                    .padding(.horizontal, Paddings.smallX)
                    .relativeLineSpacing(.em(0.25))
            }
            .thematicBreak {
                Divider()
                    .relativeFrame(height: .em(0.25))
                    .overlay(Color.customBorder)
                    .markdownMargin(top: Paddings.extraSmall, bottom: Paddings.smallX)
            }
    }
}

#Preview {
    return ScrollView {
        Markdown(sampleMarkdownText)
            .markdownTheme(.visitNotesTheme(for: .red))
    }
}


let sampleMarkdownText =
"""
# h1 Heading :-)
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading


## How we show description blocks

```
Aka: we use this as description item, it should span in multi-line text that conveys an information about the item.
```

## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is italic text_

~~Strikethrough~~


## Blockquotes


> Blockquotes can also be nested...
>> ...by using additional greater-than signs right next to each other...
> > > ...or with spaces between arrows.


## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`

## Tables

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

Right aligned columns

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |


## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


## Images

![Minion](https://placekitten.com/1000/1000)
![Stormtroopocat](https://placekitten.com/800/800)
"""
