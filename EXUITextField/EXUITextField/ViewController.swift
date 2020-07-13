//
//  ViewController.swift
//  EXUITextField
//
//  Created by yehong on 2020/7/13.
//  Copyright © 2020 yehong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    //获取屏幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用UITextField（frame：）新建一个UITextField
        let myTextField = UITextField(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
        
        //定义UITextField未编辑时预显示的内容
        myTextField.placeholder = "请输入文字"
        
        //定义边框的类型，此处为圆角类型
        myTextField.borderStyle = .roundedRect
        
        //*定义输入框右边预示清除按钮的时机，此处为编辑时预示
        myTextField.clearButtonMode = .whileEditing
        
        //定义键盘的类型，此处为可输入邮件型的键盘（有@和.）
        myTextField.keyboardType = .emailAddress
        
        //回车键的类型
        myTextField.returnKeyType = .done
        
        //定义输入字的颜色
        myTextField.textColor = UIColor.white
        
        //定义textfield的底色
        myTextField.backgroundColor = UIColor.lightGray
        
        //EXUITextField的委托为self
        myTextField.delegate = self
        
        //定义位置
        myTextField.center = CGPoint(x: fullScreenSize.width * 0.5,y: fullScreenSize.height * 0.3)
        
        //将UIView加入self.view画面
        self.view.addSubview(myTextField)
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //结束编辑，把键盘隐藏起来
        self.view.endEditing(true)
        
        return true
    }

}

