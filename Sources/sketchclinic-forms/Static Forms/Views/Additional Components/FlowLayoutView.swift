//
//  FlowLayoutView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

struct FlowLayoutView<Data, ItemView: View>: View {
    
    @Binding var items: [Data]
    
    @ViewBuilder let viewMapping: (Data) -> ItemView
    
    @State private var totalHeight: CGFloat = 0
    @State private var itemSpacing: CGFloat = 4
    
    var body: some View {
        VStack {
            GeometryReader {
                self.content(in: $0)
            }
        }.frame(height: totalHeight)
    }
    
    private func content(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        let itemCount = items.count
        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                viewMapping(item)
                  .padding([.horizontal, .vertical], itemSpacing)
                  .alignmentGuide(.leading, computeValue: { d in
                    if (abs(width - d.width) > g.size.width) {
                      width = 0
                      height -= lastHeight
                    }
                    lastHeight = d.height
                    let result = width
                    if index == itemCount - 1 {
                      width = 0
                    } else {
                      width -= d.width
                    }
                    return result
                  })
                  .alignmentGuide(.top, computeValue: { d in
                    let result = height
                    if index == itemCount - 1 {
                      height = 0
                    }
                    return result
                  })
            }
          }
          .background(HeightReaderView(binding: $totalHeight))
      }
}

private struct HeightPreferenceKey: PreferenceKey {
  static func reduce(value _: inout CGFloat, nextValue _: () -> CGFloat) {}
  static var defaultValue: CGFloat = 0
}

private struct HeightReaderView: View {
  @Binding var binding: CGFloat
  var body: some View {
    GeometryReader { geo in
      Color.clear.preference(key: HeightPreferenceKey.self, value: geo.frame(in: .local).size.height)
    }.onPreferenceChange(HeightPreferenceKey.self) { h in
      binding = h
    }
  }
}

struct FlowLayoutView_Previews: PreviewProvider {
  static var previews: some View {
      FlowLayoutView(items: .constant(["Some long item here", "And then some longer one",
                      "Short", "Items", "Here", "And", "A", "Few", "More",
                      "And then a very very very long long long long long long long long longlong long long long long long longlong long long long long long longlong long long long long long longlong long long long long long longlong long long long long long long long one", "and", "then", "some", "short short short ones"])) {
      Text($0)
        .font(.system(size: 12))
        .foregroundColor(.black)
        .padding()
        .background(RoundedRectangle(cornerRadius: 4)
                               .border(Color.gray)
                               .foregroundColor(Color.gray))
    }.padding()
  }
}
