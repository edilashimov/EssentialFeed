//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 5/31/21.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestURL: URL?
}

class RemoteFeedLoaderTests : XCTestCase {
        
    func test_init_doesNotRequestDataFromURL() {
        let _ = RemoteFeedLoader()
        let client = HTTPClient()
        
        XCTAssertNil(client.requestURL)
    }
}
