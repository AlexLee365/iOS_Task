import UIKit



//1. 첨부된 이미지를 보고 상속을 이용해 구현해보기

class Animal {
    var brain : Bool
    var legs : Int
    
    init (brain : Bool = true, legs : Int = 0)
    {
        self.brain = brain
        self.legs = legs
    }
}
var animal = Animal()
animal.brain
animal.legs




class Human : Animal {
    
    init(legs: Int = 2) {
        super.init(legs : legs)             // ★ 부모클래스의 init메소드를 초기화해줄때 부모 init의 모든 매개변수값을 넣어주지않아도, 넣어주지않은값은 부모클래스의 default값으로 자동 초기화
    }
}
var human = Human()
human.brain
human.legs


class Pet : Animal {
    var fleas : Int
    
    init (fleas : Int = 0, legs : Int = 4){
        self.fleas = fleas
        super.init(legs : legs)
    }
}
var pet = Pet()
pet.fleas
pet.legs


class Pet2 : Animal {
    var fleas : Int
    
    init (fleas: Int = 0, legs : Int = 4) {
        self.fleas = fleas
        super.init ()
        
    }
}



class Dog : Pet {
    
    init (fleas : Int =  8) {
        super.init(fleas: fleas)
    }
}
var dog = Dog()
dog.fleas
dog.legs


class Cat : Pet{
    init (fleas :Int = 4){
        super.init(fleas:fleas)
    }
}
var cat = Cat()
cat.fleas
cat.legs








//2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고
//각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
//(클래스 구현 연습)


//정사각형
class Square {
    var side1 : Int
    var perimeter : Int = 0
    
    init(side1 : Int){
        self.side1 = side1
    }
    
    func getArea() -> Int {
        return side1*side1
    }
    
    func getPerimeter() -> Int {
        perimeter = 4*side1
        return perimeter
    }
    
}

var square1 = Square(side1 : 5)
square1.getPerimeter()

//정육면체
class Cube : Square{
    override init (side1 : Int){
        super.init(side1 : side1)
        self.side1 = side1
    }
    
    func getVolume() -> Int{
        return side1*side1*side1
    }
}

var cube1 = Cube(side1 : 5)
cube1.getArea()
cube1.getVolume()





// 직사각형
class Rectangle2 {
    var side1 : Int
    var side2 : Int
    
    init (side1:Int, side2 : Int){
        self.side1 = side1
        self.side2 = side2
    }
    
    func getArea () -> Int {
        return side1*side2
    }
    func getPerimeter() -> Int {
        return side1+side2
    }
}

var rectangle2 = Rectangle2(side1 : 5,side2 : 10)
rectangle2.getArea()
rectangle2.getPerimeter()

//직육면체
class RectangularSolid : Rectangle2{
    var height : Int
    var volume : Int = 0
    
    init (side1 : Int, side2: Int, height : Int)
    {
        self.height = height
        super.init(side1 : side1, side2 : side2)
    }
    
    func getVolume(area : Int ) -> Int {
        volume = area * height
        return volume
    }
    
}

var Rec = RectangularSolid(side1 : 5,side2 : 10,height :10)

Rec.getVolume(area : Rec.getArea())


// 원
class Circle {
    var radius : Double
    
    init (radius : Int)
    {
        self.radius = Double(radius)
    }
    
    func getArea() -> Double {
        return 3.14*radius*radius
    }
    func getCircumference() -> Double {
        return 3.14*2*radius
    }
    
}

var circle3 = Circle(radius : 3)
circle3.getArea()
circle3.getCircumference()


//원기둥
class CircularCylinder : Circle{
    var height : Double
    
    init (radius : Int, height : Int){
        self.height = Double(height)
        super.init(radius : radius)
    }
    
    func getVolume(area : Double) ->Double {
        return area*height
    }
}

var CC = CircularCylinder(radius: 3, height: 10)
CC.getVolume(area: CC.getArea())



//구
class Sphere{
    var radius : Double
    
    init (radius : Int){
        self.radius = Double(radius)
    }
    
    func getVolume() -> Double {
        return radius*radius*radius*3.14*4/3
    }
}

var sphere = Sphere(radius : 5)
sphere.getVolume()



//삼각형
class Triangle2 {
    var side1 : Double
    var side2 : Double
    
    init (_ side1 : Double, _ side2 : Double) {
        self.side1 = side1
        self.side2 = side2
    }
    
    func getArea() -> Double {
        return side1*side2/2
    }
}

var triangle2 = Triangle2(5,5)
triangle2.getArea()


//원뿔
class Cone {
    var radius : Double
    var height : Double
    
    init (_ radius : Double, _ height : Double){
        self.radius = radius
        self.height = height
    }
    
    func getVolume() -> Double {
        return 3.14*radius*radius*height/3
    }
}

var cone = Cone(5,10)
cone.getVolume()


//부등변사각형
class Trapezoid {
    var side1 : Double
    var side2 : Double
    var height : Double
    
    init (_ side1 : Double, _ side2 : Double, _ height : Double) {
        self.side1 = side1
        self.side2 = side2
        self.height = height
    }
    
    func getArea() -> Double {
        return height*(side1+side2)/2
    }
}

var trapezoid = Trapezoid(5,8,10)
trapezoid.getArea()





