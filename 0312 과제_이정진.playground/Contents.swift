import UIKit

var str = "Hello, playground"


// 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
// (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)

func noName(_ a : Int, _ b : Int) -> Int {
    var bLength = String(b).count
    var aLength = String(a).count
    
    var a_size = 1
    
    for _ in 1...bLength
    {
        a_size *= 10
    }
    
    var result = a*a_size + b
    return result
    
}

noName(633, 30)
// 체감 난이도 : 중




//    - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func compareLetter(_ a : String, _ b: String){
    if ( a == b)
    {
        print("동일한 문자입니다")
    }
    else{
        print("다른 문자입니다")
    }
}
compareLetter("사과", "사과")
// 체감 난이도 : 하



//        - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func getDivisor(_ number : Int){
    if(number<=0)
    {
        print("자연수가 아닙니다")
    }
    else
    {
        for i in 1...number
        {
            if(number%i == 0)
            {
                print (i, terminator : " ")
            }
        }
        
    
    }
    print()
}

getDivisor(60)
// 체감 난이도 : 중하


//            - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
func noName3(_ number: Int)
{
    if(number<2)
    {
        print("2이상의 자연수를 입력해주세요")
    }
    else{
        var check = 0
        
        for i in 2...(number-1)
        {
            if(number%i == 0)
            {
                check += 1
            }
        }
        
        if(check==0)
        {
            print("소수 입니다")
        }
        else{
            print("소수가 아닙니다")
        }
    }
}

noName3(6)


0%2

// 체감 난이도 : 중하


// - 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수

// 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
// (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )

func fibonacci (_ number : Int) -> Int
{
    var num1 = 0
    var num2 = 1
    var nextNum = 0
    var location = 2
    var answer = 0
    
    for _ in 1... {
        
        
        if(location==number)
        {
            answer = num2
            break
        }
        else if(number==1)
        {
            answer =  0
            break
        }
        else if(number==2)
        {
            answer =  1
            break
        }
        
        nextNum = num1+num2
        num1 = num2
        num2 = nextNum
        location += 1
        
    }
    
    return answer
}

fibonacci(6)
// 체감 난이도 : 중


// - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func noName4(){
    for i in 1...100
    {
        if( i%15 == 0)
        {
            print (i, terminator:" ")
        }
    }
    
}

noName4()
//체감 난이도 : 하




