//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 5/30/21.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
