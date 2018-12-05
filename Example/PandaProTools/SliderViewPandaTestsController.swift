//
//  SliderViewPandaTestsController.swift
//  PandaProTools_Example
//
//  Created by Yestay Muratov on 11/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import PandaProTools

class TestViewForSlider: UIView {
    
    let labelTitle: UILabel = {
        let l = UILabel()
        l.text = "example test"
        l.numberOfLines = 0
        l.textColor = .white 
        return l
    }()
    
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
    
    func setupViews() {
        backgroundColor = .gray
        self.addSubview(labelTitle)
        self.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: labelTitle)
        self.addConstraintsWithFormat("V:|-16-[v0]-16-|", views: labelTitle)
    }
}

class SliderViewPandaTestsController: UIViewController {
 
    lazy var sliderView: SliderViewHorizontalPanda = { // view is going to take height of slider view
        let v = SliderViewHorizontalPanda()
        v.isToSetPageNumber = true
        v.delegate = self
        return v 
    }()
    
    let pageNumber: UIPageControl = {
        let v = UIPageControl()
        v.tintColor = .green
        return v
    }()
    
    let model: [String] = ["Hello 1", "Here 2", "We are 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        self.view.addSubview(sliderView)
        self.view.addSubview(pageNumber)
        
        view.backgroundColor = .white
        self.view.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: sliderView)
        
        self.view.addConstraintsWithFormat("V:|-80-[v0]-16-[v1(30)]", views: sliderView, pageNumber)
        pageNumber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sliderView.heightAnchor.constraint(equalTo: sliderView.widthAnchor, multiplier: 0.56).isActive = true
        
        pageNumber.numberOfPages = model.count
        pageNumber.currentPage = 0
    }
}

extension SliderViewPandaTestsController: SliderViewHorizontalPandaDelegate {
    
    func ytmSliderView(sliderView: SliderViewHorizontalPanda, didSelectItemAt index: Int, withView: UIView) {
        print("selected at index")
    }
    
    func ytmSliderViewNumberOfItems(sliderView: SliderViewHorizontalPanda) -> Int {
        return model.count
    }
    
    func ytmSliderView(sliderView: SliderViewHorizontalPanda, viewForRowAt index: Int) -> UIView {
        print("creating view for slider")
        let v = TestViewForSlider()
        v.labelTitle.text = model[index]
        return v
    }
    
    func ytmSliderView(sliderView: SliderViewHorizontalPanda, didMoveTo index: Int) {
        pageNumber.currentPage = index
    }
}

