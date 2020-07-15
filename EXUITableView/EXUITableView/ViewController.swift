//
//  ViewController.swift
//  EXUITableView
//
//  Created by yehong on 2020/7/13.
//  Copyright © 2020 yehong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //获取屏幕尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    //定义cell中的内容
    var info = [
       // ["林书豪","陈新安"],
        ["陈传银","王建民","陈金峰","林志腾"]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //定义一个名为myTableView的UITableView，并选为grouped模式且选择原点与尺寸
        let myTableView = UITableView(frame: CGRect(x: 0,y: 20,width: fullScreenSize.width,height: fullScreenSize.height - 20),style: .grouped)
        
        //*注册cell，并将其定义为reuse类型
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        //设置委任对象
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //定义分割线的的类型为单行线
        myTableView.separatorStyle = .singleLine
        
        //分割线的间距，四个值分别为上下左右的间距
        myTableView.separatorInset = UIEdgeInsets.init(top: 0,left: 20,bottom: 0,right: 20)
        
        //cell是否可以点选
        myTableView.allowsSelection = true
        
        //cell是否可以多选
        myTableView.allowsMultipleSelection = false
        
        //将tableview加入self.view画面中
        self.view.addSubview(myTableView)
        
    }

    //必须实际操作的方法：每一组有几个 cell
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    //必须实际操作的方法：每一个cell要提示的内容
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取得tableview目前使用的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as UITableViewCell
        
        //设置Accessory按钮的样式
        if indexPath.section == 1{
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            } else if indexPath.row == 1 {
                cell.accessoryType = .detailButton
            } else if indexPath.row == 2 {
                cell.accessoryType = .detailDisclosureButton
            } else if indexPath.row == 3 {
                cell.accessoryType = .disclosureIndicator
            }
        }
    
        //提示的内容
        if let myLabel = cell.textLabel {
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
        }
        
        return cell
    }

    //按下cell后执行的动作
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        //取消cell的选取状态
        tableView.deselectRow(at: indexPath,animated: true)
        
        let name = info[indexPath.section][indexPath.row]
        print("选择的是\(name)")
    }
    
    //点选Accessory按钮后执行的动作
    //必须设置cell的accessoryType
    func tableView(_ tableView: UITableView,accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let name = info[indexPath.section][indexPath.row]
        print("按下的是\(name)的detail")
    }
    
    //有几组section
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    /*
    //第一个section的标题为篮球，第二个为棒球
    func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "篮球" : "棒球"
        return title
    }
 */
}

