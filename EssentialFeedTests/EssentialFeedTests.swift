//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 5/31/21.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestURL = URL(string: "https://google.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestURL: URL?
}

class RemoteFeedLoaderTests : XCTestCase {
        
    func test_init_doesNotRequestDataFromURL() {
        let _ = RemoteFeedLoader()
        let client = HTTPClient.shared
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_requestDataFromURL() {
        let sut = RemoteFeedLoader()
        let client = HTTPClient.shared
        
        sut.load()
        XCTAssertNotNil(client.requestURL)
    }
}
