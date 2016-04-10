//
//  CommonButton.swift
//  AJ_UIKit
//
//  Created by aboojan on 16/4/10.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

class CommonButton: UIButton {

    //MARK: 重写
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        setupView();
    }
    
    override var backgroundColor: UIColor?{
        
        didSet{
            let btnImgSize = CGSizeMake(5.0, 5.0);
            
            let normalColor = backgroundColor;
            let highlightColor = darkedColor(normalColor!);
            
            let normalImg = imageWithColor(normalColor!, size: btnImgSize);
            let highlightImg = imageWithColor(highlightColor, size: btnImgSize);
            
            super.setBackgroundImage(normalImg, forState: .Normal);
            super.setBackgroundImage(highlightImg, forState: .Selected);
            super.setBackgroundImage(highlightImg, forState: .Highlighted)
        }
    }
    
    //MARK: 自定义
    private func setupView() {

        self.layer.cornerRadius = CommonDefine().CORNER_RADIUS;
        self.layer.masksToBounds = true;
    }
    
    private func darkedColor(originalColor:UIColor) -> UIColor{
        let components = CGColorGetComponents(originalColor.CGColor);
        
        let r = Float.init(components[0]);
        let g = Float.init(components[1]) - 0.2;
        let b = Float.init(components[2]) - 0.1;
        
        let changedColor = UIColor.init(colorLiteralRed: r, green: g, blue: b, alpha: 1.0);
        
        return changedColor;
        
    }

    private func imageWithColor(color:UIColor, size:CGSize) -> UIImage{
        let rect = CGRectMake(0.0, 0.0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        let theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    }
}
