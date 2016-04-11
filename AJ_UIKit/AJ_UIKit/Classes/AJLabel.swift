//
//  AJLabel.swift
//  AJ_UIKit
//
//  Created by 钟宝健 on 16/4/11.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

/// 垂直方向上的对齐方式
enum VerticalTextAlignment:NSInteger {
    case Top
    case Middle
    case Bottom
}


class AJLabel: UILabel {

    var verticalTextAlignment:VerticalTextAlignment? {
        didSet{
            self.setNeedsLayout();
        }
    };
    
    var textEdgeInsets:UIEdgeInsets? {
        didSet{
            self.setNeedsLayout();
        }
    };
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        setupViews();
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews();
    }
    
    private func setupViews() {
        self.verticalTextAlignment = .Middle;
        self.textEdgeInsets = UIEdgeInsetsZero;
    }
    
    override func drawTextInRect(rect: CGRect) {
        
        var tempRect = UIEdgeInsetsInsetRect(rect, self.textEdgeInsets!);
        
        if (self.verticalTextAlignment! == .Top) {
            
            let sizeThatFix:CGSize = self.sizeThatFits(tempRect.size);
            tempRect = CGRectMake(tempRect.origin.x, tempRect.origin.y, tempRect.size.width, sizeThatFix.height);
            
        }else if (self.verticalTextAlignment! == .Bottom){
            
            let sizeThatFix:CGSize = self.sizeThatFits(tempRect.size);
            tempRect = CGRectMake(tempRect.origin.x, tempRect.origin.y + (tempRect.size.height - sizeThatFix.height), tempRect.size.width, sizeThatFix.height);
            
        }
        
        super.drawTextInRect(tempRect);
    }
    

}
