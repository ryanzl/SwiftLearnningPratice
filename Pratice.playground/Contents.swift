//: Playground - noun: a place where people can play

import UIKit

//函数实际是一种特殊的闭包，它是一段能之后被调取的代码

//--函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}
sumOf()
sumOf(numbers: 1,2,3)

//--函数可以嵌套
func returnFifteen() -> Int {
    var y = 10
    func add() {
        
        y += 5
    }
    
    add()
    return y
}
returnFifteen()


//--函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}
var increment = makeIncrementer()//调用 makeIncrementer 函数， 返回 (Int) -> Int 类型的函数
increment(7)
increment(1)

//--函数也可以当做参数传入另一个函数。
func hasAnyMatches(list: [Int],condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20,1,23,7]
hasAnyMatches(list: numbers, condition: lessThanTen)


//--使用{}来创建一个匿名闭包，使用in将参数和返回值类型声明与闭包函数体进行分离。
numbers.map({
    (number: Int) -> Int in
    let ret = 1 + number
    return ret
})

//--简写闭包，忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mapNums = numbers.map({
    num in num + 2
})
print(mapNums)

//--通过参数位置而不是参数名字来引用参数
let sortedNums = numbers.sorted { (num1, num2) -> Bool in
    num1 > num2
}
let sortedShortNums = numbers.sorted(by: {$0 > $1})

print(sortedNums)
print(sortedShortNums)

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}