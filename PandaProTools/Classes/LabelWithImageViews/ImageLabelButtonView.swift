//
//  ImageLabelButtonView.swift
//  BIPartners
//
//  Created by Yestay Muratov on 11/6/18.
//  Copyright © 2018 PandaMobile. All rights reserved.
//

import Foundation

public class ImageLabelButtonView: ImageLabelView {
    
    public let buttonAction: UIButton = {
        let b = UIButton(type: .system)
        return b
    }()
    
    public var betweenLabelAndButton: NSLayoutConstraint!
    public var buttonHeightConstraint: NSLayoutConstraint!
    public var topConstraint: NSLayoutConstraint!
    public var bottomConstraint: NSLayoutConstraint!
    
    override public func setupViews() {
        self.addSubview(labelTitle)
        self.addSubview(imageView)
        self.addSubview(buttonAction)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        
        
        leftPadding = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        
        betweenImageLabel = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: labelTitle, attribute: .left, multiplier: 1.0, constant: -8)
        
        betweenLabelAndButton = NSLayoutConstraint(item: labelTitle, attribute: .right, relatedBy: .equal, toItem: buttonAction, attribute: .left, multiplier: 1.0, constant: -8)
        
        rightPadding = NSLayoutConstraint(item: buttonAction, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
        
        self.addConstraints([leftPadding, betweenImageLabel, betweenLabelAndButton, rightPadding])
        
//        self.addConstraintsWithFormat("V:|-4-[v0]-4-|", views: labelTitle)
        topConstraint = NSLayoutConstraint(item: labelTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 4)
        
        bottomConstraint = NSLayoutConstraint(item: labelTitle, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -4)
        
        addConstraints([topConstraint, bottomConstraint])
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: labelTitle, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: buttonAction, attribute: .centerY, relatedBy: .equal, toItem: labelTitle, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelTitle, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: buttonAction, attribute: .width, relatedBy: .equal, toItem: buttonAction, attribute: .height, multiplier: 1.0, constant: 0.0))
        
        self.imageHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageDefaultHeight)
        
        self.buttonHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageDefaultHeight)
        
        self.addConstraint(imageHeightConstraint)
        self.backgroundColor = UIColor.clear
        
        setGestureRecognizer()
    }
    
    public func setImageToButton(_ image:UIImage){
        buttonAction.setImage(image, for: .normal)
    }
}
