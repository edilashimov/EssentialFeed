//
//  CodableFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 8/12/21.
//

import XCTest
import EssentialFeed

class CodableFeedStore {
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.empty)
    }
}

class CodableFeedStoreTests: XCTestCase {
    
    func test_retrieve_deliversEmptyonEmptyCache() {
        let sut = CodableFeedStore()
        
        sut.retrieve { result in
            switch result {
            case .empty:
                break
            default:
                XCTFail("Expected empty result, received \(result) instead")
            }
        }
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = CodableFeedStore()
        
        sut.retrieve { firstResult in
            sut.retrieve { secondResult in
                
                switch (firstResult, secondResult) {
                case (.empty, .empty):
                    break
                default:
                    XCTFail("Expected retrieving twice from empty cache to deliver same empty result, received \(firstResult) and \(secondResult) instead")
                }
            }
        }
    }
}
