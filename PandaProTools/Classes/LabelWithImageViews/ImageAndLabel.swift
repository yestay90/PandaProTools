//
//  ImageAndLabel.swift
//  BIPartners
//
//  Created by Yestay Muratov on 9/16/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation
import UIKit
public class ImageLabelView: LabelWithImage {
    
    private var horizontalPaddingLeft: CGFloat = 0
    private var horizontalPaddingBetweenLabelImage: CGFloat = -8
    
    public var leftPadding: NSLayoutConstraint!
    public var betweenImageLabel: NSLayoutConstraint!
    public var rightPadding : NSLayoutConstraint!
    
    override public func setupViews(){
        
        self.addSubview(labelTitle)
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        leftPadding = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: horizontalPaddingLeft)
        
        betweenImageLabel = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: labelTitle, attribute: .left, multiplier: 1.0, constant: horizontalPaddingBetweenLabelImage)
        
        rightPadding = NSLayoutConstraint(item: labelTitle, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
        
        self.addConstraints([leftPadding, betweenImageLabel, rightPadding])
        
        self.addConstraintsWithFormat("V:|-(4)-[v0]-(4)-|", views: labelTitle)
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: labelTitle, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
         self.addConstraint(NSLayoutConstraint(item: labelTitle, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0.0))
        
        self.imageHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageDefaultHeight)
        
        self.addConstraint(imageHeightConstraint)
        self.backgroundColor = UIColor.clear
        
        setGestureRecognizer()
    }
}
