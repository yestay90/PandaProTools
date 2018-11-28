//
//  NoScrollableCollectionView.swift
//  TestNoScrollableTableView
//
//  Created by Yestay Muratov on 11/22/18.
//  Copyright © 2018 Yestay Muratov. All rights reserved.
//

import Foundation
import UIKit

public class NoScrollCollectionView: UICollectionView {
    override public var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize{
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}
