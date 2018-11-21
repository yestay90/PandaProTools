//
//  RadioButton.swift
//  BIPartners
//
//  Created by Yestay Muratov on 9/22/17.
//  Copyright © 2017 PandaMobile. All rights reserved.
//

import Foundation

public protocol RadioButtonDelegate: class {
    func radioButtonTapped(identifier: String?)
}

public class RadioButton: LabelWithImage {
    
    public weak var delegate : RadioButtonDelegate?
   
    public var unmarkedImage: UIImage? {
        didSet{
            updateViewBasedOnIsMarked()
        }
    }
    
    public var markedImage: UIImage?{
        didSet{
            updateViewBasedOnIsMarked()
        }
    }
       
    public var isMarked = false {
        didSet{
            updateViewBasedOnIsMarked()
        }
    }
    
    public init(_ unmarkedImage: UIImage, markedImage: UIImage){
        super.init()
        self.unmarkedImage = unmarkedImage
        self.markedImage = markedImage
        updateViewBasedOnIsMarked()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViewBasedOnIsMarked(){
        self.imageView.alpha = 0.0
        
        if isMarked == true {
            
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.imageView.alpha = 1.0
                self.imageView.image = self.markedImage
            })
            
        }else{
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.imageView.alpha = 1.0
                self.imageView.image = self.unmarkedImage
            })
        }
    }
    
    override public func setupViews() {
        
        self.addSubview(labelTitle)
        self.addSubview(imageView)
        
        self.labelTitle.font = UIFont.systemFont(ofSize: 14)//CurrentFont.getFont(type: .robotoRegular, size: 14)
        
        self.addConstraintsWithFormat("H:|[v0(24)]-8-[v1]|", views: imageView, labelTitle)
        
        self.addConstraintsWithFormat("V:|[v0]|", views: labelTitle)
        self.addConstraintsWithFormat("V:[v0(24)]", views: imageView)
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: labelTitle, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        self.isMarked = false
        self.labelTitle.text = "LabelTitle"
        
        setGestureRecognizer()
    }
    
    override func setGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureTapped(_:)))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true 
    }
    
    override func gestureTapped(_ tap: UITapGestureRecognizer){
        self.isMarked = !isMarked
        delegate?.radioButtonTapped(identifier: self.accessibilityIdentifier)
    }
}
extension RadioButton{
    /*getter setter*/
    func setMarkedImage(_ image: UIImage){
        self.markedImage = image
    }
    
    func setUnmarkedImage(_ image: UIImage){
        self.unmarkedImage = image
    }
}
