//
//  AJCheckBox.swift
//  JZMEnterprise
//
//  Created by 钟宝健 on 16/4/8.
//  Copyright © 2016年 Joiway. All rights reserved.
//

import UIKit

enum CheckboxImageAlignment {
    case Left
    case Right
}

protocol AJCheckboxDelegate : NSObjectProtocol {
    func checkbox(checkbox:AJCheckBox, isCheck:Bool);
}

class AJCheckBox: UIButton {
    
    private final let kDefaultBorderWidth:CGFloat = 8.0;
    private var customTitleLabel:UILabel? ;
    private var checkboxImageView:UIImageView? ;

    
    weak var privateDelegate : AJCheckboxDelegate? ;
    /// 是否可以勾选
    var canCheck:Bool = true;
    
    // MARK: - 重写SET
    
    /// 勾选框图片的对齐样式
    var checkboxImageAlignment:CheckboxImageAlignment = .Left {
        didSet{
            updateViewLayout();
        }
    };
    
    private func updateViewLayout(){
        switch self.checkboxImageAlignment {
            
        case .Left:
            self.customTitleLabel?.textAlignment = .Left;
            
            // 修改布局
            self.checkboxImageView?.aj_x = 0.0;
            self.customTitleLabel?.aj_x = CGRectGetMaxX((self.checkboxImageView?.frame)!) + kDefaultBorderWidth;
            
        case .Right:
            self.customTitleLabel?.textAlignment = .Right;
            
            // 修改布局
            self.checkboxImageView?.aj_x = self.aj_width - (self.checkboxImageView?.aj_width)!;
            self.customTitleLabel?.aj_x = kDefaultBorderWidth;
            
        }
    }
    
    /// 是否勾选
    var isCheck:Bool = false{
        didSet{
            if isCheck {
                self.checkboxImageView?.image = self.checkedImage;
            }else{
                self.checkboxImageView?.image = self.uncheckedImage;
            }
        }
    };
    
    /// 标题
    var title:String? {
        didSet{
            self.customTitleLabel?.text = title;
            self.setTitle(nil, forState: .Normal);
        }
    };
    
    /// 标题字体
    var titleFont:UIFont? {
        didSet{
            self.customTitleLabel?.font = titleFont;
        }
    };
    
    /// 勾选时的图片
    var checkedImage:UIImage! = UIImage(named: CommonDefine().imageName("ic_check_1")!) {
        didSet{
            if self.isCheck {
                self.checkboxImageView?.image = checkedImage;
            }
        }
    };
    
    /// 未勾选时的图片
    var uncheckedImage:UIImage! = UIImage(named: CommonDefine().imageName("ic_check_0")!) {
        didSet{
            if !self.isCheck {
                self.checkboxImageView?.image = uncheckedImage;
            }
        }
    };
    
    override func setTitleColor(color: UIColor?, forState state: UIControlState) {
        self.customTitleLabel?.textColor = color;
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        if self.canCheck {
            if self.isCheck {
                self.isCheck = false;
            }else{
                self.isCheck = true;
            }
        }
        
        self.privateDelegate?.checkbox(self, isCheck: self.isCheck);
        
        return super.beginTrackingWithTouch(touch, withEvent: event);
    }
    
    
    
    // MARK: - 初始化
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews();
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        
        setupViews();
    }
    
    
    func setupViews(){
        
        var checkboxImageViewWidth = self.aj_height - 2 * kDefaultBorderWidth;
        if (checkboxImageViewWidth > 19.0) {
            checkboxImageViewWidth = 19.0;
        }
        let checkboxImageViewHeight = checkboxImageViewWidth;
        let titleLabelWidth = self.aj_width - checkboxImageViewWidth - 2 * kDefaultBorderWidth;
        
        // 添加checkbox图片
        self.checkboxImageView = UIImageView(frame: CGRectMake(kDefaultBorderWidth, kDefaultBorderWidth, checkboxImageViewWidth, checkboxImageViewHeight));
        self.checkboxImageView!.center = CGPointMake(kDefaultBorderWidth + checkboxImageViewWidth / 2.0, self.aj_height / 2.0);
        addSubview(self.checkboxImageView!);
        
        // 添加标题
        self.customTitleLabel = UILabel(frame: CGRectMake(checkboxImageViewWidth + kDefaultBorderWidth, 0, titleLabelWidth, self.aj_height));
        addSubview(self.customTitleLabel!);
        
        // 默认值
        self.checkboxImageAlignment = .Left;
        self.title = self.titleForState(.Normal);
        self.titleFont = self.titleLabel?.font;
        self.isCheck = false;
    }
    
    
}
