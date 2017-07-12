/*:

[Previous](@previous)
 
## Flow control

Swift supports standard `if` statements. Note that you don't need to include parentheses around condition
 
*/
let a = 3

if a == 4 {
    print("Profit")
} else if a == 3 {
    print("Bad luck")
} else {
    print("Boom")
}


//: If we are testing multiple values, using `if` in this way is quite hard to read
func testA(a: Int, b: Int?, c: String?) {
    if a > 0 {
        if let b = b { // note that you can assign unwrapped optional value to variable of same name
            if let c = c {
                print("All ok: \(a) \(b) \(c)")
            } else {
                print("NO c")
            }
        } else {
            print("NO b")
        }
    } else {
        print("A too small")
    }
}

//: We can join multiple `if let` into one using commas, but this case doesn't clearly states what is missing!
func testB(a: Int, b: Int?, c: String?) {
    if let b = b, let c = c, a > 0 {
        print("All ok: \(a) \(b) \(c)")
    } else {
        print("Something wrong")
    }
}

//: Swift offers `guard` statement to simplify this kind of checking. It is more readable and you can be sure that you cannot fall through `else` branch.
func testC(a: Int, b: Int?, c: String?) {
    guard a > 0 else {
        print("Small a")
        return // Try deleting me
    }
    
    guard let b = b else {
        print("B is nil")
        return
    }
    
    guard let c = c else {
        print("C is nil")
        return
    }
    
    print("All ok: \(a) \(b) \(c)")
}

print("TestA:")
testA(a: 2, b: 3, c: nil)
print("\nTestB:")
testB(a: 2, b: 3, c: nil)
print("\nTestC:")
testC(a: 2, b: 3, c: nil)

//: `switch` statement in Swift is very powerful. You can specifiy wide range of matching cases.
print("\nSwitch")

let b = 3

switch b {
case 1:
    print("1")
    
case 2:
    print("2")
    
case 3...10: // ranges of numbers
    print("too high")
    
case 11...13:
    break
    
default:
    print("boom")
}

//: This demonstrates advanced cases
print("\nAdvanced switch:")

let x = 1
let y = 2

switch (x,y) {
case (0,0): print("zero")
case (_,0): print("y axis")
case (0,_): print("x axis")
case (1, let yy): print("y value \(yy)")
default: print("somewhere else")
}

//: [Next](@next)