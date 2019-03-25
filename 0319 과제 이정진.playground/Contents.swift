import UIKit

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//구현 내용은 자유롭게
//
//    ** 강아지 (Dog)
//    - 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기
//
//** 학생 (Student)
//- 속성: 이름, 나이, 학교명, 학년
//- 행위: 공부하기, 먹기, 잠자기
//
//** 아이폰(IPhone)
//- 속성: 기기명, 가격, faceID 기능 여부(Bool)
//- 행위: 전화 걸기, 문자 전송
//
//** 커피(Coffee)
//- 속성: 이름, 가격, 원두 원산지


class Dog {
    var name = "J"
    var age = 5
    var weight = 10
    var kind = "시베리안"
    
    func bark() {
        print("멍멍")
    }
    func eat() {
        print("와구작 와구작")
    }
}
var newDog = Dog()
newDog.kind
newDog.eat()

class Student {
    var name : String
    var age : Int
    var school : String
    var grade : Int
    
    init (_ name : String, _ age : Int, _ school : String, _ grade : Int){
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
}

var newStudent = Student("이정진", 25, "하버드", 3)
newStudent.name
newStudent.age
newStudent.school
newStudent.grade


class Iphone {
    var name : String
    var price : Int
    var faceID : Bool
    
    init(_ name : String, _ price : Int, _ faceID : Bool){
        self.name = name
        self.price = price
        self.faceID = faceID
    }
    
    func call(){
        print("따르릉")
    }
    func text(){
        print("문자전송")
    }
}

var iphone = Iphone("아이폰9", 1000000, true)
iphone.call()


class Coffee {
    var name : String = "카누"
    var price : Int = 2000
    var countryOfOrigin : String = "콜롬비아"
}

var coffee = Coffee()
coffee.name
coffee.price
coffee.countryOfOrigin





//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
//** 계산기 (Calculator)
//- 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
//ex)
//let calculator = Calculator() // 객체생성
//
//calculator.value  // 0
//
//calculator.add(10)    // 10
//calculator.add(5)     // 15
//
//calculator.subtract(9)  // 6
//calculator.subtract(10) // -4
//
//calculator.multiply(4)   // -16
//calculator.multiply(-10) // 160
//
//calculator.divide(10)   // 16
//calculator.reset()      // 0

class Calculator {
    var currentValue = 0
    
    func add(_ input : Int) {
        currentValue += input
        print(currentValue)
    }
    func subtract(_ input : Int) {
        currentValue -= input
        print(currentValue)
    }
    func multiply(_ input: Int) {
        currentValue *= input
        print(currentValue)
    }
    func divide(_ input: Int) {
        currentValue /= input
        print(currentValue)
    }
    func reset() {
        currentValue = 0
        print(currentValue)
    }
    
}

let calculator = Calculator() // 객체생성
//
calculator.currentValue  // 0

calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0
  

