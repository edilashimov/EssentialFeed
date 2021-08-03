//
//  XCTCaseTrackMemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Edil Ashimov on 7/24/21.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential Memory leak")
        }
    }
    
}
