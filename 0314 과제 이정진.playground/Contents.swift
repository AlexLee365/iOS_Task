import UIKit

//
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201


func convertNumber( _ a : Int ) {
    var numberArray : [Int] = []
    var num = a
    
    var numLength = String(a).count
    
    var share = 0
    var remain = 0
    
    for _ in 1...numLength {
        share = num/10
        remain = num%10
        
        numberArray.append(remain)
        num = share
    }
    
    var location = 1
    for _ in 1...(numberArray.count-1){
        location *= 10
    }
    

    var result = 0
    for i in 1...numberArray.count{
        result += numberArray[i-1]*location
        location /= 10
    }
    
    print(result)
}

convertNumber(3507)



var newArray = ["a", "b", "c", "a", "e", "d", "c"]

//newArray.remove(at: 2, 7)

//newArray.index(of:"a")
//
//while var index = newArray.index(of: "a") {
//    newArray.remove(at: index)
//}
//
//newArray



//
//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//ex). ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
func noName1() {
    var newArray = ["a", "b", "c", "a", "e", "d", "c"]
    var overlapedLettersArray : [String] = []
    
    for index in 0...(newArray.count-2) {
        for index2 in (index+1)...(newArray.count-1) {
            if(newArray[index] == newArray[index2]) {
                overlapedLettersArray.append(newArray[index])
            }
        }
    }
    
    for i in 0...(overlapedLettersArray.count-1) {
        while var index = newArray.index( of: overlapedLettersArray[i] ) {
            newArray.remove(at: index)
        }
    }
    
//    newArray.sort()
//
//    for index in 1...(newArray.count-1) {
//        if(newArray[index-1] == newArray[index]) {
//
//
//
//        }
//
//    }
    
    print(newArray)
}

noName1()



//
//- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

func noName2() {
    var newArray = [2, 8, 7, 1, 4, 3]
    var resultArray : [Int] = []
    
    for i in newArray {
        if(i%2 == 1) {
            resultArray.append(i)
        }
    }
    for i in newArray {
        if(i%2 == 0) {
            resultArray.append(i)
        }
    }
    
    print(resultArray)
    
}

noName2()



//
//- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
//enum Arithmetic {
//    case addition, subtraction, multiplication, division
//}
//func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
//    // 코드
//}
//

enum Arithmetic {
    case addition
    case subtraction
    case multiplication
    case division
}


func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    
    switch op {
    case .addition:
        return operand1+operand2
    case .subtraction:
        return operand1-operand2
    case .multiplication:
        return operand1*operand2
    case .division:
        return operand1/operand2
    default :
        return 0
    }
}

calculator(operand1: 2, operand2: 3, op: .addition)
calculator(operand1: 2, operand2: 3, op: .division)
calculator(operand1: 2, operand2: 3, op: .multiplication)
calculator(operand1: 2, operand2: 3, op: .subtraction)





//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//    + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

var dicEX = [
    "식육목" :[
        "개과" :[
            "개" :["자칼", "늑대", "북미산이리"],
            "여우" :["아메리카 여우", "유럽 여우"]
                ],
        "고양이과" :[
            "고양이" :["고양이", "살쾡이"],
            "표범" :["사자", "호랑이"]
                ]
            ]
        ]


//print(dicEX["표범"])

if let 식욕목속 = dicEX["식육목"], let 고양이과속 = 식욕목속["고양이과"], let 표범속 = 고양이과속 ["표범"] {
    for i in 표범속 {
        print(i)
    }
    
}

print (dicEX["식육목"]!["고양이과"]!["표범"]!.first!)



print(dicEX["식육목"])

