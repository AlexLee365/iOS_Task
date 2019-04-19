import UIKit

//1. 생성자 구현
//    - Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
//        - Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
//            - Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가
//
class Vehicle {
    let name: String
    let maxSpeed: Int
    
    init(name:String, maxSpeed : Int ) {
        self.name = "name"
        self.maxSpeed = maxSpeed
    }

}

class Car: Vehicle {
    var modelYear: Int
    var numberOfSeats: Int
    
    init?(modelYear : Int, numberOfSeats : Int) {
        guard numberOfSeats < 0 else { return nil }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
        super.init(name : "ABC", maxSpeed : 50)
    }
}

class Bus: Vehicle {
    let isDoubleDecker: Bool
    init(name : String, maxSpeed : Int, isDoubleDecker : Bool) {
        self.isDoubleDecker = isDoubleDecker
        super.init(name : "name", maxSpeed: maxSpeed)
    }
    
    convenience init (name: String, isDoubleDecker: Bool) {
        self.init(name : name, maxSpeed : 100, isDoubleDecker : isDoubleDecker)
 
    }
}

