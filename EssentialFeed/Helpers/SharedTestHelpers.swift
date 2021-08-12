//
//  SharedTestHelpers.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 8/11/21.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://www.any-url.com")!
}
