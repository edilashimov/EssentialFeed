//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 6/3/21.
//

import Foundation

//MARK: MAIN HTTPCLIENT PROTOCOL

public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

//MARK: REMOTE FEED LOADER FEATURE
public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            
            switch result {
            case .success(_):
                completion(.invalidData)

            case .failure(_):
                completion(.connectivity)
            }
        }
    }
    
}
