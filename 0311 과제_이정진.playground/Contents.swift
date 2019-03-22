import UIKit

//이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
func introduce ( _ name : String, _ age : Int ){
    
    print ("이름 :", name)
    print("나이 :", age)

}
introduce("이정진", 28)
// 체감 난이도 : 하



//    - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func twice (_ num : Int ) -> Int {
    return num*2
}

twice(5)
// 체감 난이도 :  하


//        - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func multiply ( _ num1 : Int, _ num2 : Int = 10 ) -> Int {
    return num1*num2
    
}
multiply(5)
// 체감 난이도 : 하

//            - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func average (_ sub1 : Double, _ sub2 : Double, _ sub3 : Double, _ sub4 : Double ) -> Double {
    var ave = (sub1+sub2+sub3+sub4)/4
    
    return ave
    
}

average(90, 80, 84, 92)
// 체감 난이도 : 하

//- 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func grade (_ point : Int ) -> String {
    var grade = "A"
    
    switch point {
    case 90... :
        grade = "A"
    case 80...89 :
        grade = "B"
    case 70...79 :
        grade = "C"
    default :
        grade = "F"
        
    }
    
    return grade
    
}
grade(82)
// 체감 난이도 : 하


//- 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func noName ( _ point : Int... ) -> String {
    var total  = 0
    for a in point {
        total += a
    }
    
    var average = total/point.count
    var grade = "A"
    
    switch average {
    case 90... :
        grade = "A"
    case 80...89 :
        grade = "B"
    case 70...79 :
        grade = "C"
    default :
        grade = "F"
        
    }
    
    return grade
    
}

noName(100,64)
// 체감 난이도 : 중하




