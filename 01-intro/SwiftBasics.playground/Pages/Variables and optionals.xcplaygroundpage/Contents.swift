/*:
[Previous](@previous)

## Variables and optionals
 
This declares constant `a` (cannot be changed, immutable) with specific type `UInt16` and sets initial value
*/
let a: UInt16 = 1

//: This declares variable `b` (can be changed, mutable). Question mark after the type means that variable can be set to `nil` (empty/no value). Optionals need special handling before their values can be used.
var b: Int? = nil

//: This demonstrates bad handling of optionals and **should not be used**
if b != nil {
    print(b!) // exclamation mark means "I am really really sure that this does not contains nil". If it does, it will crash. And you can never be sure anyways, so don't use this
} else {
    print("This is nil")
}

//: This is preferred handling of optionals. You check if optional contains value and value is assigned to `unwrappedB` in the process.
if let unwrappedB = b {
    print(unwrappedB)
} else {
    print("This is nil")
}

//: This construct provides default value in case `b` is nil. Default value below is `0` 
print(b ?? 0)


//: [Next](@next)