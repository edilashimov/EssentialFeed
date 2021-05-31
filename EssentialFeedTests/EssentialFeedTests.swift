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
        HTTPClient.shared.get(from: URL(string: "https://google.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestURL: URL?

    override func get(from url: URL) {
        requestURL = url
    }
}

class RemoteFeedLoaderTests : XCTestCase {
        
    func test_init_doesNotRequestDataFromURL() {
        let _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_requestDataFromURL() {
        let sut = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        sut.load()
        XCTAssertNotNil(client.requestURL)
    }
}
