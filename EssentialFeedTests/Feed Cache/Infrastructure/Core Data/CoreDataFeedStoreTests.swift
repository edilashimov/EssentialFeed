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
        let sut = makeSUT()
        assertThatInsertOverridesPreviouslyInsertedCacheValues(on: sut)
    }
    
    func test_insert_deliversNoErrorOnNonEmptyCache() {
        let sut = makeSUT()
        assertThatInsertDeliversNoErrorOnNonEmptyCache(on: sut)
    }
    
    func test_insert_deliversNoErrorOnEmptyCache() {
        let sut = makeSUT()
        assertThatInsertDeliversNoErrorOnEmptyCache(on: sut)
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() {
        let sut = makeSUT()
        assertThatDeleteDeliversNoErrorOnEmptyCache(on: sut)
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()
        assertThatDeleteHasNoSideEffectsOnEmptyCache(on: sut)
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
    
    private func assertThatRetrieveHasNoSideEffectsOnNonEmptyCache(on sut: FeedStore) {
        let feed = uniqueImageFeed().local
        let timestamp = Date()
        
        insert((feed: feed, timestamp: timestamp), to: sut)
        expect(sut, toRetrieveTwice: .found(feed: feed, timestamp: timestamp))
    }
    
    private func assertThatInsertDeliversNoErrorOnEmptyCache(on sut: FeedStore) {
        let insertionError = insert((uniqueImageFeed().local, Date()), to: sut)
        XCTAssertNil(insertionError, "Expected to insert cache successfully")
    }
    
    private func assertThatInsertDeliversNoErrorOnNonEmptyCache(on sut: FeedStore) {
        insert((uniqueImageFeed().local, Date()), to: sut)
        let insertionError = insert((uniqueImageFeed().local, Date()), to: sut)
        XCTAssertNil(insertionError, "Expected to override cache successfully")
    }
    
    private func assertThatInsertOverridesPreviouslyInsertedCacheValues(on sut: FeedStore) {
        insert((uniqueImageFeed().local, Date()), to: sut)
        
        let latestFeed = uniqueImageFeed().local
        let latestTimestamp = Date()
        insert((latestFeed, latestTimestamp), to: sut)

        expect(sut, toRetrieve: .found(feed: latestFeed, timestamp: latestTimestamp))
    }
    
    private func assertThatDeleteDeliversNoErrorOnEmptyCache(on sut: FeedStore) {
        let deletionError = deleteCache(from: sut)
        XCTAssertNil(deletionError, "Expected non-empty cache deletion to succeed")
    }
    
    private func assertThatDeleteHasNoSideEffectsOnEmptyCache(on sut: FeedStore) {
        deleteCache(from: sut)
        expect(sut, toRetrieve: .empty)
    }
}
