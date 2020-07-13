//
//  ViewController.swift
//  EXUITextView
//
//  Created by yehong on 2020/7/13.
//  Copyright © 2020 yehong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //获取屏幕大小
    let fullScreenSize = UIScreen.main.bounds.size
    
    //定义一个名为myTextView的UITextView
    var myTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用UITextView（frame：）定义一个名为myTextView的UITextView
        myTextView = UITextView(frame: CGRect(x: 0,y: 0,width: 250,height: 200))
        
        //定义背景颜色
        myTextView.backgroundColor = UIColor.darkGray
        
        //定义字体颜色
        myTextView.textColor = UIColor.white
        
        //定义字体类型和大小
        myTextView.font = UIFont(name: "Helvetica-Light",size: 20)
        
        //定义输入字体位置
        myTextView.textAlignment = .left
        
        //定义未编辑前预显示内容
        myTextView.text = "swift起步走"
        
        //定义键盘类型
        myTextView.keyboardType = .default
        
        //定义回车键的类型
        myTextView.returnKeyType = .default
        
        //文字是否可编辑
        myTextView.isEditable = true
        
        //文字是否可选
        myTextView.isSelectable = true
        
        //定义myTextView的位置
        myTextView.center = CGPoint(x: fullScreenSize.width * 0.5,y: fullScreenSize.height * 0.3)
        
        //将myTextView加入self.view画面
        self.view.addSubview(myTextView)
        
        //定义两个新的选项
        let mail = UIMenuItem(title: "寄送",action: #selector(ViewController.sendMail))
        let facebook = UIMenuItem(title: "FB",action: #selector(ViewController.sendFB))
        
        //建立选单
        let menu = UIMenuController.shared
        
        //将新的选项加入选单
        menu.menuItems = [mail,facebook]
        
        //增加一个触控事件,因为UITextView中回车键用于换行
        //因此，新增一个触控事件，当点击空白处时隐藏键盘
        let tap = UITapGestureRecognizer(target: self,action:
            #selector(ViewController.hideKeyboard(tapG:)))
        
        tap.cancelsTouchesInView = false
        
        //加在self.view上
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func hideKeyboard(tapG:UITapGestureRecognizer) {
        // 除了使用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        // 來針對一個元件隱藏鍵盤
        self.myTextView.resignFirstResponder()
    }

    @objc func sendMail() {
        print("sendMail")
    }
    
    @objc func sendFB() {
        print("sendFB")
    }

}

