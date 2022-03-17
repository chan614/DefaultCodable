//
//  DefaultCodable.swift
//  
//
//  Created by parkjichan on 2022/03/17.
//


public enum DefaultCodable {
    @propertyWrapper
    public struct DefaultWrapper<Source: NonNullCodable>: Codable {
        public var wrappedValue: Source.Value
        
        public init(wrappedValue: Source.Value) {
            self.wrappedValue = wrappedValue
        }
        
        public init(from decoder: Decoder) throws {
            if let container = try? decoder.singleValueContainer(),
               let value = try? container.decode(Source.Value.self)
            {
                wrappedValue = value
            } else {
                wrappedValue = Source.defaultValue
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            try wrappedValue.encode(to: encoder)
        }
    }
    
    @propertyWrapper
    public struct CastingWrapper<Source: CastingCodable>: Codable {
        public var wrappedValue: Source.Value
        
        public init(wrappedValue: Source.Value) {
            self.wrappedValue = wrappedValue
        }
        
        public init(from decoder: Decoder) throws {
            let container = try? decoder.singleValueContainer()
            if let value = try? container?.decode(Source.Value.self) {
                wrappedValue = value
            } else {
                let stringValue = try? container?.decode(String.self)
                wrappedValue = Source.cast(stringValue: stringValue)
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            try wrappedValue.encode(to: encoder)
        }
    }
}

public extension DefaultCodable {
    typealias Empty = DefaultWrapper
    typealias True = CastingWrapper<DefaultCodableSoruce.True>
    typealias False = CastingWrapper<DefaultCodableSoruce.False>
    typealias ZeroInt = CastingWrapper<DefaultCodableSoruce.ZeroInt>
    typealias InvalidInt = CastingWrapper<DefaultCodableSoruce.InvalidInt>
    typealias ZeroDouble = CastingWrapper<DefaultCodableSoruce.ZeroDouble>
    typealias InvalidDouble = CastingWrapper<DefaultCodableSoruce.InvalidDouble>
    typealias EmptyString = DefaultWrapper<DefaultCodableSoruce.EmptyString>
    typealias EmptyList<T: DefaultCodableSoruce.List> = DefaultWrapper<DefaultCodableSoruce.EmptyList<T>>
    typealias EmptyMap<T: DefaultCodableSoruce.Map> = DefaultWrapper<DefaultCodableSoruce.EmptyMap<T>>
}
