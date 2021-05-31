//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 5/30/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping () -> Void)
}
