/*:
[Previous](@previous)

## Enums

Enums represent sets of values, that are named. They have wide range of usages in Swift
 
*/
enum CarBrand: String { // you can base enum on some type, it will have something called rawValue afterwards
    case honda
    case toyota
    case ferrari = "fancy car" // you can explicitly set a raw value
    case jeep
    
    enum Skoda { // you can also nest enums, but it has one downside - this is not part of CarBrand enum
        case octavia
        case fabia
    }
}

let brand: CarBrand = .toyota

let rawBrand = CarBrand(rawValue: "toyota") // this creates optional, because there is no guarantee that the rawValue will match some enum
print(rawBrand ?? "I don't know this car")

let skoda: CarBrand.Skoda = .octavia
let skoda2 = CarBrand.Skoda.octavia


//: You can also associate values with enum cases
enum Result {
    case success(Int,String)
    case error(String)
}

let result: Result = .success(201, "201")

//: Testing for specific enum cases. Unfortunately you cannot test enums with associated values this way
if brand == .jeep {
    print("Vroom")
}

//: By using `if case` you can check for associated values of enum case
if case .success(let code, let string) = result {
    print(code)
    print(string)
}

//: And of course, `switch` is powerful especially when combined with enums
switch result {
case .success(let code, let string) where string=="\(code)": // this will match only if code and string are the same
    print("OK \(string)")
    
case .success(201, let string):
    print("Continue \(string)")
    
case .error(let message):
    print(message)
    
default:
    print("something")
}

//: You don't need to include `default` if the switch is _exhaustive_ - this means it list all cases. And it is also better, because if you add new case into enum, this code will break and not fail silently
switch brand {
case .toyota: print("toyota")
case .honda: print("honda")
case .jeep: print("jeep")
case .ferrari: print("ferrari")
}


//: [Next](@next)