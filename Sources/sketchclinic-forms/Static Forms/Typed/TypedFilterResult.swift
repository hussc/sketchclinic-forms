//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 29/10/2023.
//

import Foundation
import SwiftUI

open class TypedFilterResult<T: Codable>: FilterResult {
    @Published public var canSubmit: Bool = false
    @Published public var filtersPool: Set<AnyFilterKey> = []
    @Published public var content: T?

    public init() {
        super.init()
    }

    public init(defaultObject: T?) {
        self.content = defaultObject
        super.init()
    }

    public override init(defaultStorageRegisteration: ((FilterResult) -> Void)? = nil) {
        super.init(defaultStorageRegisteration: defaultStorageRegisteration)
    }

    public override func setValue<Key>(value: Key.Value?, for key: Key) where Key : FilterKey {
        super.setValue(value: value, for: key)

        // check for submission status :)
        checkValidations()
    }

    private func checkValidations() {
        do {
            let output = try self.output(for: T.self)

            self.content = output
            self.canSubmit = true
        } catch {
            print("Attempting to validate: \(error)")
            self.content = nil
            self.canSubmit = false
        }
    }

    public func output() -> T? {
        try? self.output(for: T.self)
    }

    public func updatingFiltersPool(from pool: Set<AnyFilterKey>) {
        self.filtersPool = pool
        self.updatingDefaultValues(from: self.content)
    }

    public func updatingDefaultValues(from object: T?) {
        guard let object else {
            self.defaultStorage = [:]
            self.checkValidations()
            return
        }

        do {
            let jsonData = try JSONEncoder().encode(object)
            guard let json = (try? JSONSerialization.jsonObject(with: jsonData)) as? [String: Any] else {
                return
            }

            for element in json {
                guard let key = (filtersPool.first { $0.identifier == element.key }),
                      let transformedValue = element.value as? FilterValueEncodable? else {
                    print("Skipping child of object: \(String(describing: element.key)), value: \(element.value)")
                    return
                }

                self.setDefaultValue(value: transformedValue, for: key)
            }
        } catch {
            print("Couldn't encode object! \(error)")
        }
    }

    private func setDefaultValue(value: FilterValueEncodable?, for key: AnyFilterKey) {
        guard let value else {
            self.defaultStorage.removeValue(forKey: key)
            return
        }

        self.defaultStorage[key] = value

        if storage[key] == nil {
            self.setValue(value: value, for: key)
        }

        isContentFiltered = !isEmpty
        self.checkValidations()
    }

    private func defaultValue(for key: AnyFilterKey) -> FilterValueEncodable? {
        defaultStorage[key]
    }

    private func value(for key: AnyFilterKey) -> FilterValueEncodable? {
        storage[key]
    }

    private func setValue(value: FilterValueEncodable?, for key: AnyFilterKey) {
        guard let value else {
            self.storage.removeValue(forKey: key)
            return
        }

        self.storage[key] = value
        isContentFiltered = !isEmpty
        self.checkValidations()
    }
}
