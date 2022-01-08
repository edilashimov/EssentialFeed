//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Edil Ashimov on 1/3/22.
//

import EssentialFeed

final class FeedViewModel {
    private let feedLoader: FeedLoader
    typealias Observer<T> = (T) -> Void
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onLoadingStateChange: Observer<Bool>?
    var onFeedLoad: Observer<[FeedImage]>?
    
    func loadFeed() {
        onLoadingStateChange?(true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.onLoadingStateChange?(false)
        }
    }
    
}
