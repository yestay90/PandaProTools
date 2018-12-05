//
//  SliderAdv.swift
//  Timetochill
//
//  Created by Yestay Muratov on 3/29/16.
//  Copyright © 2016 Yestay Muratov. All rights reserved.
//

import Foundation
import UIKit

public protocol SliderViewHorizontalPandaDelegate: class {
    func ytmSliderView(sliderView: SliderViewHorizontalPanda, didSelectItemAt index: Int, withView: UIView) 
    func ytmSliderViewNumberOfItems(sliderView: SliderViewHorizontalPanda)->Int
    func ytmSliderView(sliderView: SliderViewHorizontalPanda, viewForRowAt index: Int)-> UIView
    func ytmSliderView(sliderView: SliderViewHorizontalPanda, didMoveTo index: Int)
}

public class SliderViewHorizontalPanda: UIView, UIScrollViewDelegate {
    
    public var delegate: SliderViewHorizontalPandaDelegate?
    var pageViews:[UIView?] = []
    var scrollView: UIScrollView!
    public var selectedPage: Int?
    var timerToMoveToTheNextPage: Timer?
    public var isRandomPages = false
    var pageNumber: UIPageControl = UIPageControl(frame: .zero)
    public var isToSetPageNumber = false {
        didSet{
            setConstraintPageController()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViewsAndSetSlider()
    }
    
    public init(){
        super.init(frame: .zero)
        initViewsAndSetSlider()
    }
    
    func getNumberOfItems()-> Int {
        return delegate?.ytmSliderViewNumberOfItems(sliderView: self) ?? 0
    }
    
    func cleanArrayOfElementsInVM(){
        self.pageViews = []
    }
    
    func initViewsAndSetSlider(){
        // creating scroll view slider
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(self.scrollView)
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.backgroundColor = .black
    }
    
    func initGestureRecognizer(){
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.goLinkOfAd(_:)))
        tapgesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true 
        self.addGestureRecognizer(tapgesture)
    }
    
    @objc func goLinkOfAd(_ gesture: UITapGestureRecognizer){
        print("did tap slidet at view: \(self.selectedPage)")
    }
    
    deinit{
        switch UIDevice.current.systemVersion.compare("9.0.0", options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            print("iOS >= 9.0")
        case .orderedAscending:
            print("iOS < 9.0")
            self.scrollView.delegate = nil
        }
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        didSetView()
    }
    
    func didSetView(){
        
        self.setscrollViewConst()
        self.setConstraintPageController()
        self.setScrollAdvAndLoadPages()
        self.initGestureRecognizer()
    }
    
    func setConstraintPageController(){
        if self.isToSetPageNumber == false {
            return // not setting page number
        }
        
        pageNumber.tintColor = .white
        pageNumber.currentPage = 0
        pageNumber.numberOfPages = self.getNumberOfItems()
        pageNumber.layer.zPosition = 2
        
        self.addSubview(pageNumber)
        pageNumber.translatesAutoresizingMaskIntoConstraints = false
        pageNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pageNumber.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func setscrollViewConst(){
         self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        // set constraint to scrollview 
        let topconst = NSLayoutConstraint(item: self.scrollView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(topconst)
        
        let leftcons = NSLayoutConstraint(item: self.scrollView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(leftcons)
        
        let rightconst = NSLayoutConstraint(item: self.scrollView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(rightconst)
        
        let bottonconst = NSLayoutConstraint(item: self.scrollView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(bottonconst)
        self.updateConstraints()
        self.layoutIfNeeded()
        self.scrollView.backgroundColor = .black 
    }
    
    func setScrollAdvAndLoadPages(){
        
        // update page controller values
        let pageCount = self.getNumberOfItems()


        // 3
        for _ in 0..<pageCount {
            self.pageViews.append(nil)

        }
        
        // 4
        let pagesScrollViewSize = self.frame.size
       
        self.scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageCount),
            height: pagesScrollViewSize.height)
        
        // for some reason when scroll view loads it the content offset is not 0 , so we are setting content offset to 0 here
        
        // set random page number to slider 
        if pageCount > 0 {
            let pageWidth = self.scrollView.frame.size.width
            var pageToStart: Int!
            if self.isRandomPages == true {
                let limit : UInt32 = UInt32(pageCount)
                let random = arc4random_uniform(limit)
                pageToStart = Int(random)
            }else {
                pageToStart = 0
            }
            self.scrollView.contentOffset.x = pageWidth * CGFloat(pageToStart)
        }
        
        self.scrollView.setContentOffset(CGPoint(x: self.scrollView.contentOffset.x, y: 0), animated: false)
        
        // 5
        loadVisiblePages()
    }
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageCount = self.getNumberOfItems()
        
        if pageCount == 0 {
            return
        }
        
        let pageWidth = self.scrollView.frame.size.width
       
        
        if pageWidth == 0 { // happends when view is not set yet and we dont need to load views
            return
        }
        
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0))) // getting page by x coordinate of focus
        self.selectedPage = page
        pageNumber.currentPage = page
        self.delegate?.ytmSliderView(sliderView: self, didMoveTo: page)
        
        // Work out which pages you want to load
        var firstPage = page - 1
        let lastPage = page + 1
        
        if firstPage < 0 {
            firstPage = 0
        }
        
        if firstPage >= 0 {
            // Purge anything before the first page
            for index in 0 ..< firstPage{
                purgePage(index)
            }
        }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        let newLastPage = lastPage + 1
        if newLastPage < pageCount {
            // Purge anything after the last page
            for index in newLastPage..<pageCount{
                purgePage(index)
            }
        }
    }
    
    func loadPage(_ page: Int) {
        if page < 0 || page >= self.getNumberOfItems() {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        guard let _delegate = self.delegate else {
            return
        }
        
        if let _ = pageViews[page] {
            // Do nothing. The view is already loaded.
            // do refresh image
         
            print("we have view , dont do anything")
        } else {
            // going to create customimage view
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            let newPageView = _delegate.ytmSliderView(sliderView: self, viewForRowAt: page)
            
            newPageView.frame = frame
            self.pageViews[page] = newPageView
            
            self.scrollView.addSubview(newPageView)
            self.scrollView.bringSubview(toFront: newPageView)
            
        }
    }
    
    func purgePage(_ page: Int) {
        if page < 0 || page >= getNumberOfItems() {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    // MARK: uiscroll delegate
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.timerToMoveToTheNextPage?.invalidate()
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        loadVisiblePages()
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("did end decelerating")
        loadVisiblePages()
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("did end scrollign animation")
    }
   
    func startTimerLoop(){
        //setting time interval that will change the background image
        if self.getNumberOfItems() > 1 { // else there is no image to scroll
            self.timerToMoveToTheNextPage = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.changeBackgroundView), userInfo: nil, repeats: true)
            
        }
    }
    
    func stopTimerLoop(){
        if timerToMoveToTheNextPage != nil {
         timerToMoveToTheNextPage!.invalidate()
         timerToMoveToTheNextPage = nil
        }
    }
    
    @objc func changeBackgroundView(){
        print("ns timer is wokring good and it is not turned off")
        
        if self.getNumberOfItems() != 0 {
            
            let newContentOffsetX = scrollView.contentOffset.x + self.frame.width
            
            if newContentOffsetX >= scrollView.contentSize.width {
                self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }else {
                self.scrollView.setContentOffset(CGPoint(x: newContentOffsetX, y: 0), animated: true)
            }
            
            loadVisiblePages()
        }
    }
}
