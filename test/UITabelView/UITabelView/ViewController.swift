//
//  ViewController.swift
//  UITabelView
//
//  Created by yehong on 2020/7/14.
//  Copyright © 2020 yehong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    let fullScreenSize =  UIScreen.main.bounds.size
    
    var info = [
        ["服务条款","隐私协议","用户体验计划"]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myTableView = UITableView(frame: CGRect(x: 8.5 ,y: 190.25,width: fullScreenSize.width,height: fullScreenSize.height - 190.25),style: .grouped)
        
        myTableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.separatorStyle = .singleLine
        
        myTableView.separatorInset = UIEdgeInsets.init(top: 0,left: 8.5,bottom: 0,right: 8.5)
        
        myTableView.allowsSelection = true
        
        myTableView.allowsMultipleSelection = false
        
        self.view.addSubview(myTableView)
        
    }

    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        
        return info[section].count
    }

    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as UITableViewCell
    
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.accessoryType = .disclosureIndicator
            } else if indexPath.row == 1 {
                cell.accessoryType = .disclosureIndicator
            }else if indexPath.row == 2 {
                cell.accessoryType = .disclosureIndicator//加入UISwitch
            }
            
        }
        
    
    if let myLabel = cell.textLabel {
        myLabel.text = "\(info[indexPath.section][indexPath.row])"
    }
        
    return cell
        
    }

    func tableView(_ tableView: UITableView,didSeleceRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = info[indexPath.section][indexPath.row]
        
        print("按下的是\(name)的detail")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
}

