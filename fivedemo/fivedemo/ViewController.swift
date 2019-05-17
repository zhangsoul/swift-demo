//
//  ViewController.swift
//  fivedemo
//
//  Created by jujiakeji on 2019/5/17.
//  Copyright © 2019年 Soul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var dataSource = Array<Date>()
    let lefresh = UIRefreshControl()
    var table : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        addNewElementToArray()
        lefresh.attributedTitle = NSAttributedString(string: "拉什么拉！在拉朕就要碎了")
        lefresh.addTarget(self, action: #selector(pullTheRefresh), for: UIControl.Event.valueChanged)
        table.addSubview(lefresh)
        table.reloadData()
        
    }
    @objc func pullTheRefresh() {
        addNewElementToArray()
        lefresh.endRefreshing()
        table.reloadData()
    }
    func addNewElementToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCellForPullToRefresh")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCellForPullToRefresh")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }

}

