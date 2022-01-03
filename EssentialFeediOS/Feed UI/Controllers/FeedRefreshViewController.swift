//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Edil Ashimov on 1/2/22.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    
    private(set) lazy var view = binded(UIRefreshControl())
    private let viewModel: FeedViewModel

    init(viewModel: FeedViewModel) {
         self.viewModel = viewModel
     }
        
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onLoadingStateChange = { [weak view] isLoading in
             if isLoading {
                 view?.beginRefreshing()
             } else {
                view?.endRefreshing()
             }
             view?.endRefreshing()
         }
         view.addTarget(self, action: #selector(refresh), for: .valueChanged)
         return view
     }
}
