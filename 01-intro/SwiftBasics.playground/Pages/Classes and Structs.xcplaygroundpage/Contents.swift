/*:

[Previous](@previous)
 
## Classes and structs

If you need to group more variables to logical chunks with defined functionality, you should use classes or structs. Following example shows how to define struct
*/
struct CarStruct {
    let color: Int
    let brand: String
    var age: Int // var means this variable can be changed
}

//: This defines a class with similar content as `CarStruct`
class CarClass {
    let color: Int
    let brand: String
    var age: Int // also can be changed
    
    init(color: Int, brand: String, age: Int) { // structs are more convenient bc. this method is generated automatically for us, we need to write it manually in class
        self.age = age
        self.color = color
        self.brand = brand
    }
    
}

//: Structs are _value types_ - this means they are copied when passed around. This has one significant side effect. Observe printed values below
var carStruct1 = CarStruct(color: 0, brand: "Ferari", age: 5)
let carStruct2 = carStruct1

carStruct1.age = 20 // change something in the struct

print(carStruct1) // because structs are copied, when you change one, the other is not changed
print(carStruct2)


//: Classes are _reference types_ - this means they exist only once and only reference to them is passed around.
let carClass1 = CarClass(color: 0, brand: "Jeep", age: 5)
let carClass2 = carClass1

carClass1.age = 20 // change something in the class

print(carClass1.age) // you can see that number changed in both references
print(carClass2.age)
