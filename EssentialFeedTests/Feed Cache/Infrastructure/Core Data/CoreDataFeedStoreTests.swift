//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 11/9/21.
//

import XCTest
import EssentialFeed

class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    
    func test_retrieve_deliversEmptyonEmptyCache() {
        let sut = makeSUT()
        assertThatRetrieveDeliversOnEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()
        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }
    
    func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
        let sut = makeSUT()
        assertThatRetrieveDeliversFoundValuesOnNonEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
        
    }
    
    func test_insert_overridesPreviouslyInsertedCacheValues() {
        
    }
    
    func test_insert_deliversNoErrorOnNonEmptyCache() {
        
    }
    
    func test_insert_deliversNoErrorOnEmptyCache() {
        
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() {
        
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() {
        
    }
    
    func test_delete_deliversNoErrorOnNonEmptyCache() {
        
    }
    
    func test_delete_emptiesPreviouslyInsertedCache() {
        
    }
    
    func test_storeSideEffects_runSerially() {
        
    }
    
    
    //MARK: - Helpers
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> FeedStore {
        let storeBundle = Bundle(for: CoreDataFeedStore.self)
        let storeURL = URL(fileURLWithPath: "/dev/null")
        let sut = try! CoreDataFeedStore(storeURL: storeURL, bundle: storeBundle)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
    
    private func assertThatRetrieveDeliversOnEmptyCache(on sut: FeedStore) {
        expect(sut, toRetrieve: .empty)
    }
    
    private func assertThatRetrieveHasNoSideEffectsOnEmptyCache(on sut: FeedStore) {
        expect(sut, toRetrieveTwice: .empty)
    }
    
    private func assertThatRetrieveDeliversFoundValuesOnNonEmptyCache(on sut: FeedStore) {
        let feed = uniqueImageFeed().local
        let timestamp = Date()
       
        insert((feed: feed, timestamp: timestamp), to: sut)
        expect(sut, toRetrieve: .found(feed: feed, timestamp: timestamp))
    }
    
    private func assertThatRetrieveHasNoSideEffectsOnNonEmptyCache(on: FeedStore) {
        let sut = makeSUT()
        let feed = uniqueImageFeed().local
        let timestamp = Date()
        
        insert((feed: feed, timestamp: timestamp), to: sut)
        expect(sut, toRetrieveTwice: .found(feed: feed, timestamp: timestamp))
    }
}
