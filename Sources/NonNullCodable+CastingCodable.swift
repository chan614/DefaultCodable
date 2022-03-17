//
//  NonNullCodable+CastingCodable.swift
//  
//
//  Created by parkjichan on 2022/03/17.
//


public protocol NonNullCodable {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}

public protocol CastingCodable {
    associatedtype Value: Codable
    static func cast(stringValue: String?) -> Value
}
