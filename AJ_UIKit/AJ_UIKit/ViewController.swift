//
//  ViewController.swift
//  AJ_UIKit
//
//  Created by aboojan on 16/4/10.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AJCheckboxDelegate{

    @IBOutlet weak var checkboxBtn: AJCheckBox!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CommonButton
        let testBtn = CommonButton(type: .Custom);
        testBtn.frame = CGRectMake(20.0, 90.0, 100.0, 40.0);
        testBtn.backgroundColor = UIColor.orangeColor();
        testBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        testBtn.setTitle("测试", forState: .Normal);
        testBtn.addTarget(self, action: #selector(ViewController.testBtnClick(_:)), forControlEvents: .TouchUpInside);
        
        self.view.addSubview(testBtn);
        
        // checkbox
//        self.checkboxBtn.checkboxImageAlignment = .Right;
//        self.checkboxBtn.checkedImage = UIImage(named: "ic_check_1");
//        self.checkboxBtn.uncheckedImage = UIImage(named: "ic_check_0");
//        self.checkboxBtn.isCheck = true;
//        self.checkboxBtn.canCheck = false;
//        self.checkboxBtn.title = "checkbox标题";
//        self.checkboxBtn.titleFont = UIFont.systemFontOfSize(15.0);
        self.checkboxBtn.privateDelegate = self;
        
        // Label
        let testLabel = AJLabel(frame: CGRectMake(20.0, 200.0, 100.0, 40.0));
        testLabel.backgroundColor = UIColor.lightGrayColor();
        testLabel.verticalTextAlignment = .Top;
        testLabel.textEdgeInsets = UIEdgeInsetsMake(0.0, 8.0, 0.0, 0.0);
        testLabel.text = "测试Label";
        self.view.addSubview(testLabel);
        
    }

    
    // MARK: 事件监听
    @IBAction func loginBtnClick(sender: AnyObject){
        print("登录");
    }
    
    func testBtnClick(sender: UIButton){
        print("测试按钮：\(sender)");
    }

    // MARK: 代理
    func checkbox(checkbox: AJCheckBox, isCheck: Bool) {
        print("忘记密码：\(isCheck)");
    }

}

