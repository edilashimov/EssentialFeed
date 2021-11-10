//
//  CoreDataFeedStore.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 11/9/21.
//

import Foundation
import EssentialFeed

public final class CoreDataFeedStore: FeedStore {
  
    public init() {}

    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
        
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
        
}
