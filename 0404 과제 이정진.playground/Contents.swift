import UIKit

//1.
//Singleton 플레이그라운드에서 Singleton 을 사용하지 않고
//User 객체에 친구를 추가하는 방식 구현해보기
//(1번 도전 과제 심화: User 가 class 일 때, User 가 struct 일 때를 구분해서 구현해보기)

//class User {
//    //    static let shared = User()            // static let 으로 전역변수(타입프로퍼티)로 만들면 data영역에 저장 (User()클래스자체는 원래 Heap에 저장)
//    //  private init() {}
//    var friends: [Friends] = []
//    var blocks: [Friends] = []
//}

struct User {
//    static let shared = User()            // static let 으로 전역변수(타입프로퍼티)로 만들면 data영역에 저장 (User()클래스자체는 원래 Heap에 저장)
    //  private init() {}
    var friends: [Friends] = []
}

struct Friends {
    let name: String
}

struct FriendList {
    mutating func addFriend(name: String, classInput : User) {          // mutating 왜붙여줌??
        
        
        let friend = Friends(name: name)
        classInput.friends.append(friend)
    }
}



var friendList = FriendList()
var user1 = User()
friendList.addFriend(name: "원빈", classInput : user1)
friendList.addFriend(name: "장동건", classInput: user1)
friendList.addFriend(name: "정우성", classInput: user1)
user1.friends





