import Cocoa

var str = "Hello, playground"

/*
Let's try the extension keyword
See here: https://docs.swift.org/swift-book/LanguageGuide/Extensions.html
*/

extension String {
    func bark() {
        print("Bark!")
    }
}

let myDog: String = "dog"

myDog.bark()

/*
Let's try with a protocol!
See here for protocol extensions: https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID521
 - Use protocol extensions to provide a default implementation any method
*/



protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

class Animal : SomeProtocol {
    var name: String = ""
    var mustBeSettable: Int = 0
    var doesNotNeedToBeSettable: Int = 0
}


