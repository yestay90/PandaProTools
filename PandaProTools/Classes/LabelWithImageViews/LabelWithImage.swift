//
//  LabelWithImage.swift
//  BIPartners
//
//  Created by Yestay Muratov on 9/13/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation
import UIKit

public protocol LabelWithImageDelegate {
    func labelWithImage(didTappedWithIdentifier: String?)
}
public class LabelWithImage: UIView{
    
    public var labelTitle: UILabel = {
        let label = UILabel()
//        label.textColor = UIColor.init(hex: "#de000000")
        label.text = nil
//        label.font = CurrentFont.getFont(type: .robotoItalic, size: 10)
        label.textAlignment = .left
        label.contentMode = .left
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "arrowDown")!.withRenderingMode(.alwaysTemplate)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    public var image: UIImage? {
        didSet{
            self.imageView.image = image
        }
    }
    
    public var text: String? {
        didSet{
            self.labelTitle.text = text
            self.labelTitle.sizeToFit()
        }
    }
    
    public var imageHeightConstraint: NSLayoutConstraint!
    
    public var imageDefaultHeight: CGFloat = 24 {
        didSet{
            imageHeightConstraint.constant = imageDefaultHeight
        }
    }
    
    public var delegateLabelImage: LabelWithImageDelegate?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    public func setupViews(){
        
        self.addSubview(labelTitle)
        self.addSubview(imageView)
        
        self.addConstraintsWithFormat("H:|[v0]-(4@750)-[v1]|", views: labelTitle, imageView)
        self.addConstraintsWithFormat("V:|-(4@750)-[v0]-(4@750)-|", views: labelTitle)
        self.addConstraintsWithFormat("V:|-(8@750)-[v0]-(8@750)-|", views: imageView)
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0.0))
        
        self.backgroundColor = UIColor.clear
        
        self.imageHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageDefaultHeight)
        
        self.addConstraint(imageHeightConstraint)
        
        setGestureRecognizer()
    }
    
    func setGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureTapped(_:)))
        tap.cancelsTouchesInView = false
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    @objc func gestureTapped(_ tap: UITapGestureRecognizer){
        delegateLabelImage?.labelWithImage(didTappedWithIdentifier: self.accessibilityIdentifier)
    }
}
