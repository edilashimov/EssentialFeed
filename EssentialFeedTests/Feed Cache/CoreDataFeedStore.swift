//
//  CoreDataFeedStore.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 11/9/21.
//

import Foundation
import EssentialFeed
import CoreData

public final class CoreDataFeedStore: FeedStore {
    
    private class ManagedCache: NSManagedObject {
        @NSManaged public var timestamp: Date?
        @NSManaged public var feed: NSOrderedSet
    }
    
    private class ManagedFeedImage: NSManagedObject {
        @NSManaged public var id: UUID?
        @NSManaged public var imageDescription: String?
        @NSManaged public var location: String?
        @NSManaged public var url: URL
        @NSManaged public var cache: ManagedCache
    }
  
    public init() {}

    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
        
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
        
}
