//
//  main.swift
//  DataStructAndAlgorithm
//
//  Created by ZhangHongyun on 2020/10/29.
//

import Foundation

print("Hello, World!")
// -------------------------双向链表-------------------------//
//var linkedList = DLinkedList<String, String>()
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "1", value: "1"))
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "2", value: "2"))
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "3", value: "3"))
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "4", value: "4"))
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "5", value: "5"))
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "6", value: "6"))
//linkedList.appendToTail(node: DLinkedNode<String, String>(key: "6", value: "6"))
//print("-----------------")
//linkedList.print()
//print("-----------------")
//let node = linkedList.node(atIndex: 2)
//print(node!.value)
//linkedList.moveToHead(node: node!)
//print("-----------------")
//linkedList.print()
//print("-----------------")
//linkedList.removeLastNode()
//linkedList.insertAtHead(node: DLinkedNode<String, String>(key: "7", value: "7"))
//linkedList.print()
//print("-----------------")
//linkedList.removeLastNode()
//linkedList.print()
//print("-----------------")
//linkedList.removeLastNode()
//linkedList.print()
//print("-----------------")
//linkedList.removeLastNode()
//linkedList.print()
// ---------------------------LRU---------------------------//
print("-----------------")
var cache = LRUCache(capacity: 10)
cache.put("1", "1")
cache.put("2", "2")
cache.put("3", "3")
cache.put("4", "4")
cache.put("5", "5")
cache.put("6", "6")
cache.put("7", "7")
cache.put("8", "8")
cache.put("9", "9")
cache.put("10", "10")
cache.put("1", "1")
cache.put("2", "2")
cache.put("7", "7")
cache.put("11", "11")
print("cache size = \(cache.list.lenght)")
cache.list.print()
print("-----------------")
let value = cache.get("1")
print(value!)
print("-----------------")

