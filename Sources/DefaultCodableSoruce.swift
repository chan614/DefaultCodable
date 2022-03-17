//
//  DefaultCodableSoruce.swift
//  
//
//  Created by parkjichan on 2022/03/17.
//


public enum DefaultCodableSoruce {
    public typealias List = Codable & ExpressibleByArrayLiteral
    public typealias Map = Codable & ExpressibleByDictionaryLiteral
    
    public enum True: CastingCodable {
        public static func cast(stringValue: String?) -> Bool {
            if let stringValue = stringValue,
               let value = Bool(stringValue)
            {
                return value
            } else {
                return true
            }
        }
    }
    
    public enum False: CastingCodable {
        public static func cast(stringValue: String?) -> Bool {
            if let stringValue = stringValue,
               let value = Bool(stringValue)
            {
                return value
            } else {
                return false
            }
        }
    }
    
    public enum ZeroInt: CastingCodable {
        public static func cast(stringValue: String?) -> Int {
            if let stringValue = stringValue,
               let value = Int(stringValue)
            {
                return value
            } else {
                return .zero
            }
        }
    }
    
    public enum InvalidInt: CastingCodable {
        public static func cast(stringValue: String?) -> Int {
            if let stringValue = stringValue,
               let value = Int(stringValue)
            {
                return value
            } else {
                return -1
            }
        }
    }
    
    public enum ZeroDouble: CastingCodable {
        public static func cast(stringValue: String?) -> Double {
            if let stringValue = stringValue,
               let value = Double(stringValue)
            {
                return value
            } else {
                return .zero
            }
        }
    }
    
    public enum InvalidDouble: CastingCodable {
        public static func cast(stringValue: String?) -> Double {
            if let stringValue = stringValue,
               let value = Double(stringValue)
            {
                return value
            } else {
                return -1
            }
        }
    }
    
    public enum EmptyString: NonNullCodable {
        public static var defaultValue: String { String() }
    }
    
    public enum EmptyList<T: List>: NonNullCodable {
        public static var defaultValue: T { [] }
    }
    
    public enum EmptyMap<T: Map>: NonNullCodable {
        public static var defaultValue: T { [:] }
    }
}
