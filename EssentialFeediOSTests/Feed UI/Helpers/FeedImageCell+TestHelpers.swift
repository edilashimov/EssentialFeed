//
//  FeedImageCell+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Edil Ashimov on 1/2/22.
//

import Foundation

extension FeedImageCell {
   
   func simulateRetryAction() {
       feedImageRetryButton.simulateTap()
   }
   
   var isShowingLocation: Bool {
       return !locationContainer.isHidden
   }
   
   var locationText: String? {
       return locationLabel.text
   }
   
   var descriptionText: String? {
       return descriptionLabel.text
   }
   
   var isShowingImageLoadingIndicator: Bool {
       return feedImageContainer.isShimmering
   }
   
   var renderedImage: Data? {
       return feedImageView.image?.pngData()
   }
   
   var isShowingRetryAction: Bool {
       return !feedImageRetryButton.isHidden
   }
}
