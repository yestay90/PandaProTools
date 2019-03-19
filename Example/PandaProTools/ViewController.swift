//
//  ViewController.swift
//  PandaProTools
//
//  Created by yestay90@gmail.com on 11/21/2018.
//  Copyright (c) 2018 yestay90@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView: UITableView = {
        let v = UITableView()
        v.dataSource = self
        v.delegate = self
        return v
    }()
    
    var arrayTitles: [String] = [
        "NoScrollableTableView",
        "DateTextField",
        "SliderView",
        "PickerTextField",
        "BindingTextfield"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        configureTableView()
        view.backgroundColor = .white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTableView(){
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionFooterHeight = 1.1//CGFloat.leastNormalMagnitude
        //        self.tableView.backgroundColor = UIColor.background.light
        let footer = UIView(frame: .zero)
        self.tableView.tableFooterView = footer
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }

    func setupViews(){
        self.view.addSubview(tableView)
        self.view.addConstraintsWithFormat("H:|[v0]|", views: tableView)
        self.view.addConstraintsWithFormat("V:|-40-[v0]|", views: tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = arrayTitles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.text = title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = arrayTitles[indexPath.row]
        
        switch title {
        case "NoScrollableTableView":
            
            let vc = TestNoScrollableViewsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "DateTextField":
            
            let vc = DateTextfieldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case "SliderView":
            let vc = SliderViewPandaTestsController()
            self.navigationController?.pushViewController(vc, animated: true)
        case "PickerTextField":
            let vc = PickerTextfieldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "BindingTextfield":
            let vc = BindingTextfieldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

