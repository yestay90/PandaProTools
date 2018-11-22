//
//  NoScrollableCollectionView.swift
//  TestNoScrollableTableView
//
//  Created by Yestay Muratov on 11/22/18.
//  Copyright © 2018 Yestay Muratov. All rights reserved.
//

import Foundation
import UIKit

class NoScrollCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize{
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}
