//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 5/30/21.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
