//
//  KeyedDecodingContainerExtension.swift
//  
//
//  Created by parkjichan on 2022/03/17.
//


public extension KeyedDecodingContainer {
    func decode<P>(
        _: DefaultCodable.DefaultWrapper<P>.Type,
        forKey key: Key
    ) throws -> DefaultCodable.DefaultWrapper<P> {
        if let value = try decodeIfPresent(DefaultCodable.DefaultWrapper<P>.self, forKey: key) {
            return value
        } else {
            return DefaultCodable.DefaultWrapper(wrappedValue: P.defaultValue)
        }
    }
    
    func decode<P>(
        _: DefaultCodable.CastingWrapper<P>.Type,
        forKey key: Key
    ) throws -> DefaultCodable.CastingWrapper<P> {
        if let value = try decodeIfPresent(DefaultCodable.CastingWrapper<P>.self, forKey: key) {
            return value
        } else {
            return DefaultCodable.CastingWrapper(wrappedValue: P.cast(stringValue: nil))
        }
    }
}
