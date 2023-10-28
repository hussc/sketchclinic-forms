//
//  DateFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 26/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

extension Date: FilterValueEncodable {
    public static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    public static var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    public func encodedValueForFilter() -> Any {
        return Self.dateFormatter.string(from: self)
    }
}

public enum DateFilterKeyFormat {
    case date
    case time
}

public protocol DateFilterKey: FilterKey<Date>, PresentableFilterKey {
    var format: DateFilterKeyFormat { get }
    
    var placeholder: String { get }
    
    var minDate: Date { get }
    
    var maxDate: Date { get }
}

public extension DateFilterKey {
    var format: DateFilterKeyFormat { .date }
    var minDate: Date { Date.distantPast }
    var maxDate: Date { Date.distantFuture }
    
    func encode(value: Value, into result: inout [String : Any]) {
        switch format {
        case .date:
            result[identifier] = Date.dateFormatter.string(from: value)
        case .time:
            result[identifier] = Date.timeFormatter.string(from: value)
        }
    }
}

extension DateFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            key: self,
            viewForFilterType: DateInputFilterItemView.self
        )
    }
}
