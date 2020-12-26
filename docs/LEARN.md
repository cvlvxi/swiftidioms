```
 ___       _______   ________  ________  ________           ________  ___       __   ___  ________ _________   
|\  \     |\  ___ \ |\   __  \|\   __  \|\   ___  \        |\   ____\|\  \     |\  \|\  \|\  _____\\___   ___\ 
\ \  \    \ \   __/|\ \  \|\  \ \  \|\  \ \  \\ \  \       \ \  \___|\ \  \    \ \  \ \  \ \  \__/\|___ \  \_| 
 \ \  \    \ \  \_|/_\ \   __  \ \   _  _\ \  \\ \  \       \ \_____  \ \  \  __\ \  \ \  \ \   __\    \ \  \  
  \ \  \____\ \  \_|\ \ \  \ \  \ \  \\  \\ \  \\ \  \       \|____|\  \ \  \|\__\_\  \ \  \ \  \_|     \ \  \ 
   \ \_______\ \_______\ \__\ \__\ \__\\ _\\ \__\\ \__\        ____\_\  \ \____________\ \__\ \__\       \ \__\
    \|_______|\|_______|\|__|\|__|\|__|\|__|\|__| \|__|       |\_________\|____________|\|__|\|__|        \|__|
                                                              \|_________|                                     
```                                                                                         
                                                                                         
                                                                                        

<!-- vscode-markdown-toc -->
* [Links](#Links)
* [Types](#Types)
	* [Num Literals](#NumLiterals)
	* [Cast](#Cast)
	* [Boolean checks](#Booleanchecks)
* [Type Aliasing](#TypeAliasing)
* [Vars](#Vars)
* [Interpolation](#Interpolation)
* [Random](#Random)
* [Optional Types](#OptionalTypes)
	* [if let for unwrapping](#ifletforunwrapping)
	* [Multi if let with some condition](#Multiifletwithsomecondition)
	* [Implicitly unwrapped optional using !](#Implicitlyunwrappedoptionalusing)
	* [Unwrapping with !](#Unwrappingwith)
	* [Unwrapping inside if nil check](#Unwrappinginsideifnilcheck)
* [Error handling](#Errorhandling)
	* [try catch](#trycatch)
* [Assert](#Assert)
* [Collections](#Collections)
* [Array](#Array)
	* [Initialization](#Initialization)
	* [Init Repeat](#InitRepeat)
	* [Init Literals](#InitLiterals)
	* [isEmpty](#isEmpty)
* [Set](#Set)
	* [init](#init)
	* [Subsets](#Subsets)
* [Tuples](#Tuples)
* [Dictionary](#Dictionary)
	* [Init](#Init)
	* [For k,v](#Forkv)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

## <a name='Links'></a>Links
- [Swift Documentation](https://developer.apple.com/documentation/swift)
- [Swift-book](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)

-----------------------------------------------------------

## <a name='Types'></a>Types

- Int
- Uint
- String
- Float
- Bool: true / false
- Chracter: "A"
- Double 

### <a name='NumLiterals'></a>Num Literals

```swift
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
```

### <a name='Cast'></a>Cast

```swift
let pi: Float = 3.145

var some_int: Int = Int(pi)

print(some_int)
```

### <a name='Booleanchecks'></a>Boolean checks

```swift
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."
```

- Cannot use numeric types as boolean yay

-----------------------------------------------------------

## <a name='TypeAliasing'></a>Type Aliasing

```
typealias AudioSample = UInt16
```

-----------------------------------------------------------

## <a name='Vars'></a>Vars

- `let` vs `var`
- Let is immutable 
- Var is mutable 

-----------------------------------------------------------

## <a name='Interpolation'></a>Interpolation 

```swift
var hello: String = "Some string"
hello.append("dog")
print("THis is some string: \(hello)")
```

-----------------------------------------------------------

## <a name='Random'></a>Random

```swift
var rand_int = Int.random(in: 1...200)

```
Requires the variable in: being specified 

-----------------------------------------------------------

## <a name='OptionalTypes'></a>Optional Types

```swift
// Options
let someInt: Int? = nil
if someInt != nil {
    print("Hello")
} else {
    print("Goodbye")
}
```

### <a name='ifletforunwrapping'></a>if let for unwrapping

```swift
if let i = someInt {
    print(i)
}
```
HELL YES 

### <a name='Multiifletwithsomecondition'></a>Multi if let with some condition 

```swift
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"
```

MOar with condition working

```swift
var someInt: Int? = nil;
someInt = 20
var someInt2: Int? = 20
if let i = someInt, let j = someInt2, i < j {
    print(i)
}
```

```swift
var someInt2: Int? = nil;
if let i = someInt, let j = someInt2 {
    print(i)
}
```

Did not print

MOAR!!

### <a name='Implicitlyunwrappedoptionalusing'></a>Implicitly unwrapped optional using !

```swift
let someStr: String! = "Here is a string"
```

Can be used without unwrapping

### <a name='Unwrappingwith'></a>Unwrapping with !

```swift
var someInt: Int? = nil;
someInt = 20
var someInt2: Int? = nil;
let sum = someInt! + someInt2!
print(sum)
```

This will except because someInt2 is nil 

### <a name='Unwrappinginsideifnilcheck'></a>Unwrapping inside if nil check

```swift
var someInt: Int? = nil;
someInt = 20
var someInt2: Int? = nil;
if someInt != nil {
    print(someInt!)
}
```

- Without ! you get Optional(20)

## <a name='Errorhandling'></a>Error handling

```swift
func canThrowAnError() throws {
    // this function may or may not throw an error
}
```

### <a name='trycatch'></a>try catch

```swift
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

```

-----------------------------------------------------------

## <a name='Assert'></a>Assert

```swift
assert(true == false, "this is not ok")
```

-----------------------------------------------------------


## <a name='Collections'></a>Collections

## <a name='Array'></a>Array

### <a name='Initialization'></a>Initialization

```swift
var someInts = [Int]()
```

### <a name='InitRepeat'></a>Init Repeat

```
var threeDoubles = Array(repeating: 0.0, count: 3)
```

### <a name='InitLiterals'></a>Init Literals

```
var shoppingList: [String] = ["Eggs", "Milk"]
```

### <a name='isEmpty'></a>isEmpty

```
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
}
```
-----------------------------------------------------------

## <a name='Set'></a>Set 

### <a name='init'></a>init

```
var letters = Set<Character>()
```

Can iterate over set like array

### <a name='Subsets'></a>Subsets

```
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
```

-----------------------------------------------------------

## <a name='Tuples'></a>Tuples

```swift
let http404Error = (404, "Not Found")
```
- Tuple Destructuring

```swift
let (dog, cat) = ("hello", "world")
```

-----------------------------------------------------------

## <a name='Dictionary'></a>Dictionary

### <a name='Init'></a>Init 

```swift

var emptyDict: [String: String] = [:] // Similar to groovy
emptyDict["hello"] = "world"

print(emptyDict)
print(emptyDict.keys)
```

### <a name='Forkv'></a>For k,v 

for (key, value) in emptyDict {
    print("Key: \(key) Value: \(value)")
}

```

- You can print collections
- for (k,v) in dict { ... }

- Mixed Dictionary types

```swift
var emptyDict: [String: Any] = [:] // Similar to groovy
emptyDict["hello"] = "world"
emptyDict["dog"] = 123
emptyDict["cat"] = ["another": "dict"]
```

### if let with Dictionary

```swift
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."
```

### <a name='Keyexists'></a>Key exists?

```swift
let keyExists = emptyDict["somekey"]
print(keyExists) // nil 
```

### <a name='FiltersSorting'></a>Filters & Sorting
- [Predicate Programming](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html#//apple_ref/doc/uid/TP40001789)
- [Filter](https://developer.apple.com/documentation/swift/sequence/3018365-filter)

Use $0 for the equivalent of $it in groovy

```swift

var emptyDict: [String: Any] = [:] // Similar to groovy
emptyDict["hello"] = "world"
emptyDict["dog"] = 123
emptyDict["cat"] = ["another": "dict"]

emptyDict.forEach { print($0) }
---
(key: "dog", value: 123)
(key: "hello", value: "world")
(key: "cat", value: ["another": "dict"])
---
let hello = emptyDict.filter { $0.key == "hello" }
print(hello)
```

-----------------------------------------------------------

## <a name='Operations'></a>Operations
- `+ - / %`
- + for str concat
- `a += 2`
- Tuple Conditional Comparison

```swift
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
```

### <a name='Ternaryoperator'></a>Ternary operator ?

```swift
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
```

### <a name='Nilcoalescingoperator'></a>Nil coalescing operator ?? 

If a nil then set to b 

```swift
var colorNameToUse = userDefinedColorName ?? defaultColorName
```

### <a name='Ranges1...5'></a>Ranges 1...5
- Three dots
- INCLUSIVE
- i.e. 1.2.3.4.5

### <a name='HalfOpenRange1..5'></a>Half Open Range 1..<5
- Won't incldue 5

### <a name='Onesidedrangenames1...'></a>One sided range names[1...]
- names[2...] gets everything from 2 onwards
- names[...10] everything till 10

-----------------------------------------------------------

## <a name='Strings'></a>Strings

### <a name='Checkstringemptystr.isEmpty'></a>Check string empty str.isEmpty
```swift
if emptyString.isEmpty {
    print("Nothing to see here")
}
```

### <a name='StringCopiesCompilerOptimization'></a>String Copies + Compiler Optimization
* Swift’s String type is a value type. 
* If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable.
* However behind the scenes, Swift’s compiler optimizes string usage so that actual copying takes place only when absolutely necessary. This means you always get great performance when working with strings as value types.

### <a name='StringCountstr.count'></a>String Count str.count
Self explainatory

### <a name='Stringsplitstr.splitseperator:'></a>String split `str.split(seperator: ",")`

```swift
var myString: String = "Here, is, my, cool String"
let parts = myString.split(separator: ",")
```

### <a name='Stringtrimming'></a>String trimming

```swift
myString.trimmingCharacters(in: .whitespacesAndNewlines)
```

### <a name='StringInsert'></a>String Insert

```swift
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
```

### <a name='Stringslice'></a>String slice

```swift
let beginning = greeting[..<index]
```

### <a name='SubstringCheckString'></a>Substring Check String

```
print(myString.contains("Here"))
```

-----------------------------------------------------------

## Functions
### Variadic Parmas

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
```

### inout params

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

```

### Functors

```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
```

-----------------------------------------------------------

## Closures 

```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

-----------------------------------------------------------

## <a name='Modules'></a>Modules
- [Foundation](https://developer.apple.com/documentation/foundation)
    - Contains [primitive types](https://developer.apple.com/documentation/foundation/numbers_data_and_basic_values)
    - [String Library](https://developer.apple.com/documentation/foundation/strings_and_text)
    - [Collection Library](https://developer.apple.com/documentation/foundation/collections) - Array, Set, Dictionary

-----------------------------------------------------------

## <a name='Xcodethings'></a>Xcode things
- Alt+Click to view variable type
- Cmd+Backspace - Delete line (dd)
- Run: cmd + R
- Hightlight multiple lines: Shift + Up / down
- Multiple cursor: Shift + ctrl + Up / down


-----------------------------------------------------------

## Classes + Protocols

### Setters and Getters

```swift
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
```
Look at how fullname is set 

### mutating

```swift
protocol Togglable {
    mutating func toggle()
}
```

Specify mutating to say it will mutate the obj

### Protocols with init definition

```swift
protocol SomeProtocol {
    init(someParameter: Int)
}
```

### Subclass that overrides super but also implements protocol init

Use `required override init` 

```swift
protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}
```

### protocols as types
- Just like in rust use protocols like traits to say whatever implements this protocol


### Extend existing type to conform to protocol

``` swift
protocol TextRepresentable {
    var textualDescription: String { get }
}

//The Dice class from above can be extended to adopt and conform to TextRepresentable:

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
```

If your type already confirms but needs to be made aware use `extension Type: Protocol {}`