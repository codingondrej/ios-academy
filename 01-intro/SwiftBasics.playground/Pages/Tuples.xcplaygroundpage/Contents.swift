/*:
[Previous](@previous)
 
## Tuples

You can group variables into _tuples_. Tuple is basically a bag of loosely related variables.
*/
let myTuple = (1, "Hello world", [4,3,4])

//: Access members of the tuple using indexes
print(myTuple.0) // prints 1
print(myTuple.1) // prints "Hello world"


//: You can also name variables in the tuple to create _named tuple_. This is better in some cases, because you don't need to use numeric indexes - they tend to be easily broken/changed.
let myNamedTuple = (age: 22, name: "John", surname: "Doe")

//: Access variables in the named tuple using their names
print(myNamedTuple.name)
print(myNamedTuple.age)

//: [Next](@next)