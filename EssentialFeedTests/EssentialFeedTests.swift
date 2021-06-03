//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 5/31/21.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestURL: URL?
    
    func get(from url: URL) {
        requestURL = url
    }
}

class RemoteFeedLoaderTests : XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy() 
        let _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestURL)
    }
    
    func test_requestDataFromURL() {
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)

        sut.load()
        XCTAssertEqual(client.requestURL, url)
    }
}
