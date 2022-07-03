import UIKit

enum ReaderType: String {
    case child
    case student
    case adult
}

enum LibraryDepartment: String {
    case childlike
    case comics
    case national
}

protocol Visitors {
    var name: String {get set}
    var post: String {get set}
    func sayHello()
}

protocol Library {
    var hall: String {get set}
}

struct ReaderStruct {
    let name: String
    let type: ReaderType
    func say() {
        print("Heelo, my name is \(name), I am \(type)")
    }
}

struct LibraryStruct {
    let floor: Int
    let department: LibraryDepartment
}

struct foodCort {
    let floor: Int
    let menu: String
}

class ReaderClass {
    let name: String = "Default"
    let type: ReaderType = .student
    
    func say() {
        print("Hello, my name is \(name), I am \(type)")
    }
}

class LibraryClass: Library {
    var hall: String = "main hall"
    let floor: Int = 1
    let department: LibraryDepartment = .national
}

class Worker {
    let name: String = "Max"
    let stage: Int = 6
    let department: LibraryDepartment = .childlike
}

class vipReader: ReaderClass {
    let status: String = "VIP"
    override func say() {
        super.say()
        print("I am VIP, I am better")
    }
}

class Book {
    let whoWantBook: ReaderType = .adult
    let timeForBring: Int = 21
    let name: String = "Nikita"
    
    func bring() {
        print("Hello, my name is \(name), I want to bring this book for \(timeForBring) days")
    }
}

let person1 = Book()
person1.bring()
let person2 = vipReader()
person2.say()
let person3 = ReaderClass()
person3.say()
