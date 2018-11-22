//
//  View.swift
//  BIPartners
//
//  Created by Yestay Muratov on 9/11/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func removeAllAddedViews(){
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    public func addConstraintsWithFormat(_ format: String!, views: UIView...){
        
        var viewsDictionary = [String: UIView]()
        
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func addRoundCorners(corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height:  radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func setShadowToView(_ shadowColor: UIColor! = UIColor.black){
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
        shadowLayer.fillColor = UIColor.clear.cgColor
        
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3)
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowRadius = 2
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func addTopLine(color: UIColor, lefPadding: CGFloat = 0, rightPadding: CGFloat = 0, topPadding: CGFloat = 0){
        let lineView = UIView()
        lineView.backgroundColor = color
        
        self.addSubview(lineView)
        
        self.addConstraintsWithFormat("H:|-\(lefPadding)-[v0]-\(rightPadding)-|", views: lineView)
        
      self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: topPadding))
        self.addConstraintsWithFormat("V:[v0(1)]", views: lineView)
    }
    
    func addBottomLine(color: UIColor, lefPadding: CGFloat = 0, rightPadding: CGFloat = 0, bottomPadding: CGFloat = 0){
        let lineView = UIView()
        lineView.backgroundColor = color
        
        self.addSubview(lineView)
        
        self.addConstraintsWithFormat("H:|-\(lefPadding)-[v0]-\(rightPadding)-|", views: lineView)
        
        self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .bottomMargin, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1.0, constant: bottomPadding))
        self.addConstraintsWithFormat("V:[v0(1)]", views: lineView)
    }
    
    
    // new constraint functions
    func anchorToTop(top :NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil){
        
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
    
    func addHeightConstraint(_ height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
