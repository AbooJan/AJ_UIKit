# AJ_UIKit
一些常用的UI控件封装, 支持Storyboard和纯代码

--

#### 圆角按钮 `CommonButton`
 ```swift
  let testBtn = CommonButton(type: .Custom);
  testBtn.frame = CGRectMake(20.0, 90.0, 100.0, 40.0);
  testBtn.backgroundColor = UIColor.orangeColor();
  testBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal);
  testBtn.setTitle("测试", forState: .Normal);
  testBtn.addTarget(self, action: #selector(ViewController.testBtnClick(_:)), forControlEvents: .TouchUpInside);
        
  self.view.addSubview(testBtn);
 ```
 
#### 单选项 `Checkbox`
 ```swift
  self.checkboxBtn.checkboxImageAlignment = .Right;
  self.checkboxBtn.checkedImage = UIImage(named: "ic_check_1");
  self.checkboxBtn.uncheckedImage = UIImage(named: "ic_check_0");
  self.checkboxBtn.isCheck = true;
  self.checkboxBtn.canCheck = false;
  self.checkboxBtn.title = "checkbox标题";
  self.checkboxBtn.titleFont = UIFont.systemFontOfSize(15.0);
  self.checkboxBtn.privateDelegate = self;
 ```
