//
//  XCTestCase+FeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 9/3/21.
//

import XCTest

extension FeedStoreSpecs where Self: XCTestCase {
    @discardableResult
     func insert(_ cache: (feed: [LocalFeedImage], timestamp: Date), to sut: FeedStore) -> Error? {
        let exp = expectation(description: "Wait for cache retrieval")
        var insertionError: Error?
         sut.insert(cache.feed, timestamp: cache.timestamp) { result in
              if case let Result.failure(error) = result { insertionError = error }
              exp.fulfill()
          }
          wait(for: [exp], timeout: 1.0)
        return insertionError
    }
    
    @discardableResult
     func deleteCache(from sut: FeedStore) -> Error? {
        let exp = expectation(description: "Wait for cache deletion")
        var deletionError: Error?
         sut.deleteCachedFeed { result in
              if case let Result.failure(error) = result { deletionError = error }
              exp.fulfill()
          }
          wait(for: [exp], timeout: 1.0)
        return deletionError
    }
    
    func expect(_ sut: FeedStore, toRetrieve expectedResult: FeedStore.RetrievalResult, file: StaticString = #file, line: UInt = #line) {
        let exp = expectation(description: "Wait for completion")
        
        sut.retrieve { retrievedResult in
            switch (expectedResult, retrievedResult) {
            case (.success(.none), .success(.none)),
                 (.failure, .failure):
                break
            case let (.success(expectedCache), .success(retrievedCache)):
                XCTAssertEqual(retrievedCache?.feed, expectedCache?.feed, file: file, line: line)
                XCTAssertEqual(retrievedCache?.timestamp, expectedCache?.timestamp, file: file, line: line)

            default:
                XCTFail("Expected to retrieve \(expectedResult), got \(retrievedResult) instead", file: file, line: line)
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
    
     func expect(_ sut: FeedStore, toRetrieveTwice expectedResult: FeedStore.RetrievalResult, file: StaticString = #file, line: UInt = #line) {
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
    }
    
}

