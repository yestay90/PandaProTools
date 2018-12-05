//
//  PageControllerLabelView.swift
//  CTOgram
//
//  Created by Yestay Muratov on 3/10/18.
//  Copyright © 2018 PandaMobile. All rights reserved.
//

import Foundation

class PageControllerLabelView: UIView {
    let labelPage: UILabel = {
        let l = UILabel()
        l.textColor = .white
//        l.font = CurrentFont.getFont(type: .sfRegular, size: 12)
        l.text = "label numbers"
        return l
    }()
    
    var text: String? {
        didSet{
            labelPage.text = text 
        }
    }
    
    var numberOfPages: Int = 0
    var currentPage: Int = 0 {
        didSet{
            text = "\(currentPage + 1) / \(numberOfPages)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews(){
        self.addSubview(labelPage)
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
//        self.layer.backgroundColor = SavedColors.setColorGreyTransparent().cgColor
        
        self.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: labelPage)
        self.addConstraintsWithFormat("V:|-4-[v0]-4-|", views: labelPage)
    }
}
