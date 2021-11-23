//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 5/30/21.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (FeedLoader.Result) -> Void)
}
