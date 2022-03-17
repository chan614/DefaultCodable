# DefaultCodable
Swift codable with default value

## Example

```swift
struct ExampleModelA: Codable {
    
    @DefaultCodable.InvalidInt
    var intType: Int
    
    @DefaultCodable.EmptyString
    var stringType: String
    
    @DefaultCodable.EmptyList
    var listType: [String]
    
    @DefaultCodable.Empty<Person>
    var person: Person
}

struct Person: Codable, NonNullCodable {
    
    @DefaultCodable.InvalidInt
    var id: Int
    
    @DefaultCodable.EmptyString
    var name: String
    
    var age: Int?
    
    static var defaultValue: Person {
        return .init(id: -10, name: "Tom", age: 10)
    }
}
```
