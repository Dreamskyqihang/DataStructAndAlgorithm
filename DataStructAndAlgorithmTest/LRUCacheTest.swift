//
//  LRUCacheTest.swift
//  DataStructAndAlgorithmTest
//
//  Created by ZhangHongyun on 2020/11/20.
//

import XCTest

class LRUCacheTest: XCTestCase {

    override func setUp() {
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLRUCacheLimit() throws {
        let cache = LRUCache(capacity: 10)
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
        XCTAssertEqual(cache.count(), 10)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            let cache = LRUCache(capacity: 1000000)
            for i in 0..<1000000 {
                cache.put("\(i)", "\(i)")
            }
        }
    }

}
