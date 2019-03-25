import UIKit

//
//[ 연습 문제 ]
//# 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

func noName(_ num : Int) -> Int {
    var total : Int = 0
    
    if num<=0 {
        for i in 0...abs(num) {
            total += i
        }
        total *= -1
        total += 1
    } else {
        for i in 1...num {
            total += i
        }
    }
    
    return total
}

noName(5)
noName(-2)




//# 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
//e.g.  123 -> 6 ,  5678 -> 26
func noName2(_ num : Int) -> Int {
    var num = num
    let length = String(num).count
    var total : Int = 0
    
    for _ in 1...length {
        total += num%10
        num /= 10
    }
    return total
}

noName2(5678)





//# 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
func noName3(_ num : Int) {
    var temp : Int
    var check : Bool
    var result : String = ""
    
    for i in 1...num {
        check = false
        temp = i
        
        while temp>0 {
            if (temp%10)==3 || (temp%10)==6 || (temp%10)==9 {
                check = true
                break
            }
            temp /= 10
        }
        
        switch check{
        case true :
//            print("*,", terminator : " ")
            result += "*, "
        default :
//            print(i, ",", terminator : " ")
            result += "\(i), "
        }
    }
    
    result.remove(at: result.index(before: result.endIndex))            // 문자열의 맨끝 문자 제거
    result.remove(at: result.index(before: result.endIndex))
    
    print(result)
}

noName3(30)




//# 하샤드 수 구하기
//- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
//e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.
func noName4(_ num : Int) {
    var temp = num
    var total = 0
    
    while temp>0 {
        total += temp%10
        temp /= 10
    }
    
    if num%total==0, num>9 {
        print("하샤드 수 입니다")
    }else {
        print("하샤드 수가 아닙니다")
    }
    
}

noName4(11)
noName4(12)

//# 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
//e.g.  Input : 6, 9   ->  Output : 18, 3
func noName5(_ num1 : Int, _ num2 : Int) {
    var divisionNumber1 : [Int] = []
    var divisionNumber2 : [Int] = []
    var commonDivision : [Int] = []
    var highestCommonDivisionNumber : Int
    var lowestCommonMultipleNumber : Int
    
    for i in 1...num1 {
        if num1%i == 0 {
            divisionNumber1.append(i)
        }
    }
    for i in 1...num2 {
        if num2%i == 0 {
            divisionNumber2.append(i)
        }
    }
    
    for i in divisionNumber1 {
        for j in divisionNumber2 {
            if i==j {
                commonDivision.append(i)
            }
        }
    }
    
    commonDivision.sort()
    highestCommonDivisionNumber = commonDivision.last!
    
    lowestCommonMultipleNumber = num1*num2/highestCommonDivisionNumber
    
    
    print("최대공약수 : ", highestCommonDivisionNumber, "최소공배수 : ", lowestCommonMultipleNumber)
    
}

noName5(6,9)



// 최대공약수
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
