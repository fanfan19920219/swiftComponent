//
//  ViewControllertwo.swift
//  展开预览
//
//  Created by Farben on 2020/9/23.
//  Copyright © 2020 foxdingding. All rights reserved.
//

import Foundation
import UIKit


class ViewControllertwo: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    private lazy var models:NSMutableArray = {
        var models = NSMutableArray.init()
        return models
    }()
           
           
    private lazy var tableView:UITableView = {
        var tableView = UITableView.init(frame: CGRect(x: 0, y: 64, width: view.frame.size.width, height: view.frame.size.height - 64), style: .plain);
               tableView.delegate = self
               tableView.dataSource = self
               return tableView
           
    }()
           
           
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
            
            var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerID")
            if header == nil{
                header = UITableViewHeaderFooterView.init(reuseIdentifier: "headerID")
                header?.textLabel?.font = UIFont.systemFont(ofSize: 16)
                header?.textLabel?.textColor = .red
            }
    //        header?.textLabel?.text = "\(section)"
            return header
    }
           
           
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model : model = (models[indexPath.section] as! NSArray)[indexPath.row] as! model
        return model.rowHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let m : NSArray = models[section] as! NSArray
        return m.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID")
            cell?.textLabel?.textColor = .black
        }
        
        cell?.textLabel?.text = "数据结构:"
        
        for _ in 0...0{
            cell?.textLabel?.text = cell?.textLabel?.text?.appending("\(indexPath.section)")
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        for (section,arr) in models.enumerated() {
            if section == indexPath.section{
                for (row,_) in (arr as! NSArray).enumerated() {
                    
                    let model : model = (models[section] as! NSArray )[row] as! model
                    
                    if row == indexPath.row{
                        if model.rowHeight == 44 {
                            model.rowHeight = 100
                        }else{
                            model.rowHeight = 44
                        }
                    }else{
                         model.rowHeight = 44
                    }
                }
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view, typically from a nib.
           self.title = "展开预览"
        tableView.tableHeaderView = UIView.init()
        tableView.tableFooterView = UIView.init()
        view.addSubview(tableView)
           
        for _ in 0...10 {
            let m = model.init()
            let sectionArray = NSArray.init(object: m)
            self.models.add(sectionArray)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

