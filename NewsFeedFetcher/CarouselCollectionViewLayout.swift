//
//  CarouselCollectionViewLayout.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class CarouselCollectionViewLayout: UICollectionViewFlowLayout {
    
    private(set) var previousOffset: CGFloat = 0
    private(set) var currentPage: Int = 0
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let itemsCount = collectionView?.numberOfItems(inSection: 0) ?? 0
        
        if ((previousOffset > (collectionView?.contentOffset.x ?? 0)) && (velocity.x < 0.0)) {
            currentPage = max(currentPage - 1, 0);
        } else if ((previousOffset < (collectionView?.contentOffset.x ?? 0)) && (velocity.x > 0.0)) {
            currentPage = min(currentPage + 1, itemsCount - 1);
        }
        
        let updatedOffset = rectForIndex(currentPage).origin.x;
        previousOffset = updatedOffset;
        
        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
    }
    
    func rectForIndex(_ index:Int) -> CGRect {
        let x = (itemSize.width * CGFloat(index)) + ((minimumInteritemSpacing / 2) * CGFloat(index))
        previousOffset = x
        return CGRect(x: x, y: 0, width: itemSize.width, height: itemSize.height)
    }

}
