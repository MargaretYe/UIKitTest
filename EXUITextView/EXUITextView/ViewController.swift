//
//  ViewController.swift
//  EXUITextView
//
//  Created by yehong on 2020/7/13.
//  Copyright © 2020 yehong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    var myTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTextView = UITextView(frame: CGRect(x: 0,y: 0,width: 250,height: 200))
        
        myTextView.backgroundColor = UIColor.darkGray
        
        myTextView.textColor = UIColor.white
        
        myTextView.font = UIFont(name: "Helvetica-Light",size: 20)
        
        myTextView.textAlignment = .left
        
        myTextView.text = "swift起步走"
        
        myTextView.keyboardType = .default
        
        myTextView.returnKeyType = .default
        
        myTextView.isEditable = true
        
        myTextView.isSelectable = true
        
        myTextView.center = CGPoint(x: fullScreenSize.width * 0.5,y: fullScreenSize.height * 0.3)
        
        self.view.addSubview(myTextView)
        
        let mail = UIMenuItem(title: "寄送",action: #selector(ViewController.sendMail))
        let facebook = UIMenuItem(title: "FB",action: #selector(ViewController.sendFB))
        
        let menu = UIMenuController.shared
        
        menu.menuItems = [mail,facebook]
        
        let tap = UITapGestureRecognizer(target: self,action: Selector("keyboardHide:"))
        
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
        
    }

    @objc func sendMail() {
        print("sendMail")
    }
    
    @objc func sendFB() {
        print("sendFB")
    }

}

