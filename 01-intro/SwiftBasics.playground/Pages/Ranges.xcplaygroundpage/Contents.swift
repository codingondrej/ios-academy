/*:
[Previous](@previous)

## Ranges

You can use _ranges_ instead of plain old `for` cycle, which is quite error-prone.

This range will not include number `5`, only `0` to `4`
*/
for i in 0..<5 {
    print(i)
}
print("--")

//: This range will include number `5`
for i in 0...5 {
    print(i)
}
print("--")

//: You can easily reverse range
for i in (0...5).reversed() {
    print(i)
}


//: You can use ranges to extract parts of the arrays

let names = ["Adam", "Bedrich",  "Cecil", "David", "Emily", "Filip"]

print(names[0..<2])
print(names[4...5])

//: [Next](@next)