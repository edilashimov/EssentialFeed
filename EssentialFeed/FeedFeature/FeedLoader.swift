//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 5/30/21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
