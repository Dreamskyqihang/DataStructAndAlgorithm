//
//  LRUCache.swift
//  DataStructAndAlgorithm
//
//  Created by ZhangHongyun on 2020/10/29.
//

import Foundation

/// 双向链表节点
public class DLinkedNode<K, V>: Equatable where K: Equatable {

    var key: K
    var value: V
    var pre: DLinkedNode?
    var next: DLinkedNode?

    init(key: K, value: V) {
        self.key = key
        self.value = value
    }

    public static func == (lhs: DLinkedNode<K, V>, rhs: DLinkedNode<K, V>) -> Bool {
        return lhs.key == rhs.key
    }
}

/// 双向链表
public class DLinkedList<K, V>: NSObject where K: Equatable {
    typealias Node = DLinkedNode<K, V>

    /// 链表头结点
    private(set) var head: Node?
    /// 链表尾结点
    private(set) var tail: Node?
    /// 链表长度
    public private(set) var lenght: Int = 0
    /// 链表是否为空
    public func isEmpty() -> Bool {
        lenght != 0
    }

    override init() {

    }

    /// 在链表结尾插入节点
    func appendToTail(node: Node) {

        if let tailNode = tail {
            tailNode.next = node
            node.pre = tailNode
        } else {
            head = node
        }
        tail = node
        lenght += 1
    }

    /// 在链表头部插入节点
    func insertAtHead(node: Node) {
        if head == nil {
            head = node
            tail = node
        } else {
            node.next = head
            head?.pre = node
            head = node
        }
        lenght += 1
    }

    /// 取出第x个节点
    func node(atIndex index: Int) -> Node? {
        guard index < lenght - 1, index > 0, head != nil else { return nil }

        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }

    /// 移除第x个节点
    @discardableResult
    func removeNode(atIndex index: Int) -> Node? {
        guard index < lenght - 1, index > 0 else { return nil }
        if index == 0 {
            head?.next?.pre = nil
            head = head?.next
        }
        var pre = head
        var cur = head?.next
        // 找到节点
        for _ in 1..<index {
            pre = pre?.next
            cur = cur?.next
        }
        // 删除节点
        let next = cur?.next
        next?.pre = pre
        pre?.next = next

        lenght -= 1

        return cur
    }

    /// 将节点挪动到头部
    func moveToHead(node: Node) {
        guard node != head else { return }
        if node == tail {
            guard let lastNode = removeLastNode() else { return }
            insertAtHead(node: lastNode)
        } else {
            // 从原来位置删除
            node.next?.pre = node.pre
            node.pre?.next = node.next

            // 在头部添加
            head?.pre = node
            node.next = head
            head = node
        }
    }

    /// 移除最后一个节点
    @discardableResult
    func removeLastNode() -> Node? {
        let lastNode = tail
        tail = lastNode?.pre
        lastNode?.pre?.next = nil
        lastNode?.pre = nil

        lenght -= 1

        return lastNode
    }
    
    /// 打印链表
    func print() {
        guard head != nil else { return }
        Swift.print("DLinkedList Lenght = \(lenght)")
        var node = head
        while node != nil {
            Swift.print(node!.value)
            node = node?.next
        }
    }
}


public class LRUCache {

    private let capacity: Int
    public var list: DLinkedList = DLinkedList<String, Any>()
    private var map: [String: DLinkedNode<String, Any>] = [:]
    init(capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: String) -> Any? {
        if let node = map[key] {
            list.moveToHead(node: node)
            return node.value
        } else {
            return nil
        }
    }

    func put(_ key: String, _ value: Any) {

        if map.keys.contains(key) {
            // 缓存中已存在，更新value
            guard let node = map[key] else { return }
            node.value = value
            list.moveToHead(node: node)
        } else {
            // 缓存中未存在，插入缓存
            let node = DLinkedNode<String, Any>(key: key, value: value)
            if list.lenght < capacity {
                // 缓存未满
                list.insertAtHead(node: node)
            } else {
                // 缓存已满
                let lastNode = list.removeLastNode()
                map.removeValue(forKey: lastNode?.key ?? "")
                list.insertAtHead(node: node)
            }
            map[key] = node
        }
    }

    func count() -> Int {
        return list.lenght
    }
    
}
