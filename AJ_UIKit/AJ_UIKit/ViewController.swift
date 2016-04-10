//
//  ViewController.swift
//  AJ_UIKit
//
//  Created by aboojan on 16/4/10.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testBtn = CommonButton(type: .Custom);
        testBtn.frame = CGRectMake(20.0, 90.0, 100.0, 40.0);
        testBtn.backgroundColor = UIColor.orangeColor();
        testBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        testBtn.setTitle("测试", forState: .Normal);
        testBtn.addTarget(self, action: #selector(ViewController.testBtnClick(_:)), forControlEvents: .TouchUpInside);
        
        self.view.addSubview(testBtn);
    }

    
    // MARK: 事件监听
    @IBAction func loginBtnClick(sender: AnyObject){
        print("登录");
    }
    
    func testBtnClick(sender: UIButton){
        print("测试按钮：\(sender)");
    }


}

