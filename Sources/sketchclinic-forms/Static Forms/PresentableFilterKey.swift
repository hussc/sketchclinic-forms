//
//  PresentableFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI

/**
 Any Filter can be presentable as a view when it provides "How" it should be displayed, this protocol requires one property that specifies how the filter should be rendered.
 
 Clients can choose from the wide variety of view descriptors available, or, they can implement their own defining way specifying how the filter should be presented to the user.
 */
public protocol PresentableFilterKey: View, FilterKey {
    var title: String? { get }
}

extension PresentableFilterKey {
    public var title: String? { nil }
}
