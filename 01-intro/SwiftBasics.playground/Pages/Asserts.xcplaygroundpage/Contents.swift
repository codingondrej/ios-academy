/*:
[Previous](@previous)

## Asserts

Use `assert` with a condition to check if something is true. If first argument evaluates to false, program will crash. Asserts are disabled in release builds - this means it will not crash in production
*/

let number = 2
assert(number > 0)
assert(number > 0, "Optional message")

//: Use `assertionFailure` instead of `assert(false)` - when you know you are somewhere where you shouldn't be
assertionFailure("Something is broken")


//: `precondition` is stronger form of assert. It is enabled even in **release builds**
precondition(number > 0)
precondition(number > 0, "Optional message")


//: same as with `assertionFailure`
preconditionFailure("Something is broken in production")

//: [Next](@next)