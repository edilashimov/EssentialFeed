//
//  ValidateFeedCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 8/11/21.
//

import XCTest
import EssentialFeed

class ValidateFeedCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessaageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (LocalFeedLoader, FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(store, file: file, line: line)
        return (sut, store)
    }
}
