import UIKit

/***************************************************
 더블 링크드 리스트
 
 [ 프로퍼티 ]
 private var head: Node?
 private weak var tail: Node?
 var isEmpty: Bool
 var first: Node?
 var last: Node?
 var count: Int
 
 [ 메서드 ]
 scanValues()  - 현재 저장된 모든 노드의 값 출력
 removeAll()   - 모든 노드 제거
 removeNode(by value: String) -> Bool      - 밸류를 이용해 노드 제거 후 성공 여부
 removeNode(at index: Int) -> String?      - 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
 node(by value: String) -> Node?           - 지정한 값을 지닌 노드를 찾아 반환
 insert(node newNode: Node, at index: Int) - 특정 위치에 노드 삽입
 append(node: Node)                        - 마지막 부분에 노드 삽입
 ***************************************************/


protocol LinkedListStack {
    var size: Int { get }     // 전체 개수
    var isEmpty: Bool { get } // 노드가 있는지 여부
    var head: Node? { get }   // 링크드 리스트 시작 지점
    
    func scanValues()  // - 현재 저장된 모든 노드의 값 출력
    func append(appendNode: Node)                        // - 마지막 부분에 노드 삽입
//    func insert(node newNode: Node, at index: Int?) // - 특정 위치에 노드 삽입
//    func removeAll()   // - 모든 노드 제거
//    func removeNode(by value: String) -> Bool      // - 밸류를 이용해 노드 제거 후 성공 여부
//    func removeNode(at index: Int) -> String?      // - 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
//    func node(by value: String) -> Node?           // - 지정한 값을 지닌 노드를 찾아 반환
}

class Node {
    var value: String?
    var next: Node?
    var prior: Node?
    
    init(value : String) {
        self.value = value
    }
}


class DoubleLinkedList: LinkedListStack {
    
    var size: Int = 0
    
    var isEmpty: Bool { return head == nil}
    
    var head: Node?     // 초기값으로 고정
    
    var tempHead: Node?
    var tempNode: Node?
    
    
    var lastNode: Node? {
        guard var node = head else { return nil }
        while let nextNode = node.next {
            node = nextNode
        }
        return node
    }
    
    func scanValues() {
        guard var node = head else { print("There is no Node"); return }
        while let nextNode = node.next {
            print("\(node.value!) => ", terminator: "")
            node = nextNode
        }
        print(lastNode!.value!, ", size : \(size)")
    }
    
    func append(appendNode: Node) {
        guard let _ = head else { head = appendNode; size += 1; return }
        tempNode = lastNode
        lastNode?.next = appendNode
//        print("●●●●●● appendNode :", appendNode.value)
//        print("●●●●●● lastNode :", lastNode?.value)
        appendNode.prior = tempNode
//        print("●●●●●● appendNode.prior : ", appendNode.prior?.value)
        size += 1
    }
    
    func insert(node newNode: Node, at index: Int?) {
        
        let index = index ?? size+1             // index == nil 일경우 size+1 값을 넣어줘서 append메소드 실행하게함
        
        guard index>0 else { print("인덱스는 1이상부터 입력해주세요"); return }
        guard index<=size else { self.append(appendNode: newNode) ; return }       // 입력한 index가 size보다 클경우 append메소드 실행하여 마지막에 추가
        
        var node = head!
        var countIndex = 1
        while let nextNode = node.next {
            
            if index == 1 {
                head = newNode
                head?.next = node
                node.prior = head
                size += 1
                break
            } else if countIndex == index-1 {
                node.next = newNode
                newNode.prior = node
                newNode.next = nextNode
                nextNode.prior = newNode
                size += 1
                break
            }
            node = nextNode
            countIndex += 1
        }
    }
    
    func removeAll() {
//        var node = head
//        while var nextNode = node?.next {
//            node = nextNode
//            nextNode = nil
//        }
        head = nil
        size = 0
    }
    func node(by value: String) -> Node? {
        guard var node = head else { print("There is no Node"); return nil }
        while let nextNode = node.next {
            if node.value == value {
                return node
            }
            node = nextNode
        }
        print("There is no Node with value '\(value)'")
        return nil
    }

    func removeNode(by value: String) -> Bool {
        guard var node = head else { print("There is no Node"); return false }
        while let nextNode = node.next {
            if node.value == value {
                if let _ = node.prior {         // node.prior 이 없을수도 있기때문. => 없는경우는 node = head  첫번째 노드일경우
                    node.prior!.next = node.next
                    node.next?.prior = node.prior
                } else {                        // node = head 첫번째 노드일경우 => 첫번째 노드를 제거해주면서 node.next(다음노드)를 head로 만들어주어야함
                    head = node.next
                    head?.prior = nil
                }
                size -= 1
                return true
            }
            
            if nextNode.value == value {        // 마지막 노드값과 같을때 (상위 if문에서는 마지막 노드까지 검사하지못함)
                node.next = nil
                nextNode.prior = nil
                size -= 1
                return true
            }
            node = nextNode
        }
        
        print("There is no Node with value '\(value)'")
        return false
    }

    func removeNode(at index: Int) -> String? {

        guard index > 0 && index <= size  else { print("인덱스는 1이상, \(size)이하로 입력해주세요"); return nil }
        
        var node = head!
        var countIndex = 1
        var returnNode: Node?
        while let nextNode = node.next {
            
            if index == 1 {
                returnNode = head
                head = head?.next
                head?.prior = nil
                size -= 1
                break
            } else if countIndex == index-1 {
                // K => A => B => F => C 의 상황으로 가정할 때
                // index == 2일때 node = K / nextNode = A   => A를 지워야함 =>    결과값 : K -> B -> F...
                
                returnNode = nextNode
                node.next = nextNode.next
                
                if let _ = nextNode.next {          // nextNode.next 가 있을때 (nextNode가 마지막노드라면 .next가 nil임)
                    nextNode.next!.prior = node
                }
                
                size -= 1
                break
            }
            node = nextNode
            countIndex += 1
        }
        return returnNode?.value
    }
}

var doubleLinked = DoubleLinkedList()
doubleLinked.append(appendNode: Node(value: "A"))
doubleLinked.lastNode?.value
doubleLinked.lastNode?.prior
doubleLinked.lastNode?.next

doubleLinked.append(appendNode: Node(value: "B"))
doubleLinked.lastNode?.value
doubleLinked.lastNode?.prior?.value
doubleLinked.head?.value
doubleLinked.head?.next?.value

doubleLinked.append(appendNode: Node(value: "C"))
doubleLinked.lastNode?.prior?.value
doubleLinked.scanValues()

doubleLinked.insert(node: Node(value: "F"), at: 3)
doubleLinked.insert(node: Node(value: "K"), at: 1)
doubleLinked.scanValues()

doubleLinked.removeNode(at: 5)
doubleLinked.scanValues()


doubleLinked.removeNode(by: "C")
doubleLinked.head?.next?.value
doubleLinked.lastNode?.value
doubleLinked.scanValues()

doubleLinked.scanValues()
doubleLinked.node(by: "G")

doubleLinked.insert(node: Node(value: "F"), at: nil)

//doubleLinked.removeAll()
//doubleLinked.scanValues()
//doubleLinked.lastNode?.value
//doubleLinked.node(by: "C")





