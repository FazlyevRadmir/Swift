import UIKit
 
protocol HomeworkService {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    func fibonacci(n: Int) -> [Int]
    
    func sort(rawArray: [Int]) -> [Int]

    func firstLetter(strings: [String]) -> [Character]

    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct Task1 : HomeworkService {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let integer = x / y
        let remain = x - (integer * y)
        return (integer, remain)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var number0 = 0
        var number1 = 1
        var number: Int
        var numbers = [number0, number1]
        for _ in 0...(n - 3) {
            number = number0 + number1
            number0 = number1
            number1 = number
            numbers.append(number)
        }
        return numbers
    }

    func sort(rawArray: [Int]) -> [Int] {
        var rawArray = rawArray
        for i in 0..<rawArray.count {
            let index = (rawArray.count - 1) - i
            for j in 0..<index {
                let number = rawArray[j]
                let nextNumber = rawArray[j + 1]
                
                if number > nextNumber {
                    rawArray[j] = nextNumber
                    rawArray[j + 1] = number
                }
            }
        }
        return rawArray
    }

    func firstLetter(strings: [String]) -> [Character] {
        var characters = [Character]()
        for i in 0..<strings.count {
            let char = strings[i][strings[i].startIndex]
            characters.append(char)
        }
        return characters
    }

    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var filteredArray = [Int]()
        for i in 0..<array.count {
            let resultCondition = condition( { (n: (Int) -> Bool) in
                if array[i] > n {
                    return true
                }
            })
            if resultCondition == true {
                filteredArray.append(array[i])
            }
        }
        return filteredArray
    }
}


let homeWorkInstance = Task1()
print(homeWorkInstance.divideWithRemainder(11, by: 3))
print(homeWorkInstance.fibonacci(n: 10))
print(homeWorkInstance.sort(rawArray: [1, 4, 2, 3, 5]))
print(homeWorkInstance.firstLetter(strings: ["Фазлыев", "Радмир", "Римович"]))
//print(homeWorkInstance.filter(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], condition: (condition(n: 4))))

