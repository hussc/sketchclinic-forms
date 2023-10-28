//
//  DateInputFilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 26/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

struct DateInputFilterItemView<Key: DateFilterKey>: FilterItemView {
    @EnvironmentObject private var filterResult: FilterResult
    
    @Environment(\.isRequired) var isRequired
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.styles) var styles

    let key: Key
    let dateFormatter: DateFormatter
    
    @State private var title: String?
    @State private var currentDateString: String? = nil
    @State private var showDatePicker = false
    
    init(key: Key) {
        self.key = key
        self.dateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.setLocalizedDateFormatFromTemplate(key.format == .date ? "dd/MM/yyyy" : "HH:mm")
            formatter.dateFormat = key.format == .date ? "dd/MM/yyyy" : "HH:mm"
            return formatter
        }()
    }
    
    var body: some View {
        Button(action: {
            showDatePicker = true
        }, label: {
            
            if let title {
                headerView(for: title)
                Spacer().frame(height: 8)
            }
            
            HStack {
                Text(currentDateString ?? key.placeholder)
                    .foregroundColor(filterResult.value(for: key) == nil ? styles.secondaryTextColor : styles.textColor)
                    .font(styles.bodyFont)
                Spacer()
                Image(systemName: key.format == .date ? "calendar" : "clock")
                    .renderingMode(.template)
                    .foregroundColor(styles.accentColor)
            }
            .frame(height: 48)
            .padding(.horizontal)
            .overlay(RoundedRectangle(cornerRadius: 10) .stroke(styles.borders, lineWidth: 1))
            .background(isEnabled ? Color.white : styles.placeholderColor)
            .cornerRadius(10.0)
            .disabled(isEnabled)
        })
        .onAppear {
            if let value = filterResult.value(for: key) {
                self.currentDateString = dateFormatter.string(from: value)
            }
        }.onChange(of: key, perform: { value in
            self.currentDateString = dateFormatter.string(from: value)
        }).onReceive(NotificationCenter.default.publisher(for: filtersShouldbeClearedNotification), perform: { _ in
            if let value = filterResult.value(for: self.key) {
                self.currentDateString = dateFormatter.string(from: value)
            } else {
                self.currentDateString = nil
            }
        })
        .popover(isPresented: $showDatePicker, attachmentAnchor: .point(UnitPoint.bottom), arrowEdge: .top, content: {
            DatePickerView(title: key.placeholder, format: self.key.format == .date ? .date : .time, minDate: key.minDate, maxDate: key.maxDate, date: filterResult.binding(for: key, defaultValue: Date()), showDatePicker: $showDatePicker)
        })
    }
    
    
    @ViewBuilder func headerView(for title: String) -> some View {
        VStack {
            HStack(alignment: .top, spacing: 2){
                Text(title)
                    .font(styles.headlineFont)
                    .foregroundColor(styles.textColor)
                if isRequired {
                    Image(systemName: "asterisk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .foregroundColor(styles.accentColor)
                }

                Spacer()
            }
        }
    }
}

struct DateInputFilterItemView_Previews: PreviewProvider {
    struct SampleFilter: DateFilterKey {
        var identifier: String { "sample_date" }
        var placeholder: String { "Select Date" }
    }
    
    static var previews: some View {
        DateInputFilterItemView(key: SampleFilter())
            .environmentObject(FilterResult())
    }
}

extension DateInputFilterItemView {
    public struct DatePickerView: View {
        enum Format {
            case date
            case time
        }
        
        let title: String
        let format: Format
        
        var minDate = Date()
        var maxDate = Date().advanceBy(days: 356 * 20)
        
        @Binding var date: Date
        @Binding var showDatePicker: Bool
        @Binding var initDateValue: String

        @Environment(\.styles) var styles

        init(title: String,
             format: Format = .date,
             minDate: Date = Date(),
             maxDate: Date = Date().advanceBy(days: 356 * 20),
             date: Binding<Date>,
             showDatePicker: Binding<Bool>,
             initDateValue: Binding<String> = .constant("")
        ) {
            self.title = title
            self.format = format
            self.minDate = minDate
            self.maxDate = maxDate
            _date = date
            _showDatePicker = showDatePicker
            _initDateValue = initDateValue
        }
        
        public var body: some View {
            VStack {
                if format == .date {
                    DatePicker(title, selection: _date, in: minDate...maxDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .font(styles.bodyFont)
                } else {
                    DatePicker(title, selection: _date, in: minDate...maxDate, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .font(styles.bodyFont)
                }
                
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("done".Localized()) {
                        self.showDatePicker = false
                    }
                }
            }
            .padding()
            .background(Color.white)
        }
        
    }
}

extension Date {
    func advanceBy(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
}
