//
//  ViewController.swift
//  TestNoScrollableTableView
//
//  Created by Yestay Muratov on 11/22/18.
//  Copyright © 2018 Yestay Muratov. All rights reserved.
//

import UIKit
import PandaProTools

class TestNoScrollableViewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = false
        sv.keyboardDismissMode = .onDrag
        return sv
    }()
    
    let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var contentViewHeightConst: NSLayoutConstraint!
    var scrollBottomConsts: NSLayoutConstraint!
    
    let labelTitle: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 22)
        l.text = "This is how we test scrollabel test"
        return l
    }()
    
    lazy var tableView: NoScrollableTableView = {
        let v = NoScrollableTableView()
        v.delegate = self
        v.dataSource = self 
        return v
    }()
    
    public var arrayTitles: [String] = [
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
        "Hello this is me",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViews()
        setLocalViews()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupViews(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        self.view.addConstraintsWithFormat("H:|[v0]|", views: scrollView)
        self.view.addConstraintsWithFormat("V:|[v0]", views: scrollView)
        
        scrollBottomConsts = scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        scrollBottomConsts.isActive = true
        
        self.scrollView.addConstraintsWithFormat("H:|[v0]|", views: contentView)
        self.scrollView.addConstraintsWithFormat("V:|[v0]-(>=8)-|", views: contentView)
        
        contentViewHeightConst = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0.0)
        contentViewHeightConst.priority = UILayoutPriority(rawValue: 100)
        view.addConstraint(contentViewHeightConst)
        
        view.addConstraint(NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
    }
    
    func setLocalViews(){
        contentView.addSubview(labelTitle)
        contentView.addSubview(tableView)
        
        contentView.addConstraintsWithFormat("H:|[v0]|", views: labelTitle)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: tableView)
        
        contentView.addConstraintsWithFormat("V:|-40-[v0]-8-[v1]-8-|", views: labelTitle, tableView)
    }
    
    func configureTableView(){
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionFooterHeight = 1.1//CGFloat.leastNormalMagnitude
//        self.tableView.backgroundColor = UIColor.background.light
        let footer = UIView(frame: .zero)
        self.tableView.tableFooterView = footer
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }
    
    // MARK: table view delegate and datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = arrayTitles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.text = title
        
        return cell!
    }
}


