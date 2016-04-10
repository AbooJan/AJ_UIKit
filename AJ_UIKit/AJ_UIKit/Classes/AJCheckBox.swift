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
    /// 勾选时的图片
    var checkedImage:UIImage! = UIImage(named: CommonDefine().imageName("ic_check_1")!);
    /// 未勾选时的图片
    var uncheckedImage:UIImage! = UIImage(named: "ic_check_0");
    /// 是否勾选
    var isCheck:Bool = false;
    /// 是否可以勾选
    var canCheck:Bool = true;
    /// 标题
    var title:String? ;
    /// 标题字体
    var titleFont:UIFont? ;
    
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
            var checkboxImageFrame = self.checkboxImageView?.frame;
            checkboxImageFrame?.origin.x = 0;
            self.checkboxImageView?.frame = checkboxImageFrame!;
            
            var titleLabelFrame = self.customTitleLabel?.frame;
            titleLabelFrame?.origin.x = CGRectGetMaxX(checkboxImageFrame!) + kDefaultBorderWidth;
            self.customTitleLabel?.frame = titleLabelFrame!;
            
        case .Right:
            self.customTitleLabel?.textAlignment = .Right;
            
            // 修改布局
            var checkboxImageFrame = self.checkboxImageView?.frame;
            checkboxImageFrame?.origin.x = self.bounds.size.width - (checkboxImageFrame?.size.width)!;
            self.checkboxImageView?.frame = checkboxImageFrame!;
            
            
        }
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
        // 默认值
        self.checkboxImageAlignment = .Left;
        self.title = self.titleForState(.Normal);
        self.titleFont = self.titleLabel?.font;
        
        var checkboxImageViewWidth = self.bounds.size.height - 2 * kDefaultBorderWidth;
        if (checkboxImageViewWidth > 19.0) {
            checkboxImageViewWidth = 19.0;
        }
        let checkboxImageViewHeight = checkboxImageViewWidth;
        let titleLabelWidth = self.bounds.size.width - checkboxImageViewWidth - 2 * kDefaultBorderWidth;
        
        // 添加checkbox图片
        self.checkboxImageView = UIImageView(frame: CGRectMake(kDefaultBorderWidth, kDefaultBorderWidth, checkboxImageViewWidth, checkboxImageViewHeight));
        self.checkboxImageView!.center = CGPointMake(kDefaultBorderWidth + checkboxImageViewWidth / 2.0, self.bounds.size.height / 2.0);
        addSubview(self.checkboxImageView!);
        
        // 添加标题
        self.customTitleLabel = UILabel(frame: CGRectMake(checkboxImageViewWidth + kDefaultBorderWidth, 0, titleLabelWidth, self.bounds.size.height));
        addSubview(self.customTitleLabel!);
    }
    
    

    
}
