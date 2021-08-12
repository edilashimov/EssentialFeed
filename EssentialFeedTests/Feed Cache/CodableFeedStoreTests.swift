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
}
