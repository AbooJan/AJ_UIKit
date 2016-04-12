//
//  AJTextView.swift
//  AJ_UIKit
//
//  Created by 钟宝健 on 16/4/12.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

class AJTextView: UITextView {
    
    // MARK: -
    final let kPlaceHolderTextColor = UIColor(white: 0.7, alpha: 1.0);
    final let kLetterCountFont = UIFont.systemFontOfSize(12);
    final let kLetterCountColor = UIColor.whiteColor();
    final let kSpaceWidth:CGFloat = 8.0;
    final let kLetterCountWidth:CGFloat = 35.0;
    final let kLetterCountHeight:CGFloat = 20.0;
    
    
    // MARK: -
    /// 是否限制最大输入长度,默认不限制
    var limitContentLength:Bool? = false ;
    /// 是否超出最大长度
    private(set) var isOverMaxLength:Bool? = false;
    
    private var placeHolderLabel:UILabel? ;
    private var letterCountLabel:UILabel? ;
    
    // MARK: - 重写Set
    override var text: String! {
        didSet {
            refreshPlaceholder();
        }
    }
    
    override var font: UIFont? {
        didSet {
            self.placeHolderLabel?.font = font;
            
            setNeedsLayout();
            layoutIfNeeded();
        }
    }
    
    var placeholder:String? {
        didSet {
            self.placeHolderLabel?.text = placeholder;
            refreshPlaceholder();
        }
    };
    
    var cornerRadius:CGFloat? = 0.0 {
        didSet {
            if cornerRadius > 0 {
                self.layer.cornerRadius = cornerRadius!;
                self.layer.masksToBounds = true;
            }
        }
    };
    
    /// 最大输入长度
    var maxLetterCount:NSInteger? = 0 {
        didSet {
            showLetterCount(maxLetterCount!);
            refreshLetterCount();
        }
    };
    
    /// 是否显示输入计数，默认不显示
    var isShowLetterCount:Bool? = false {
        didSet {
            if isShowLetterCount! {
                self.letterCountLabel?.alpha = 1.0;
            }else {
                self.letterCountLabel?.alpha = 0.0;
            }
        }
    };
    
    
    // MARK: - 初始化
    private func initialize() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textViewDidChange(_:)), name: UITextViewTextDidChangeNotification, object: self);
        
        self.placeHolderLabel = UILabel();
        self.placeHolderLabel?.lineBreakMode = .ByCharWrapping;
        self.placeHolderLabel?.numberOfLines = 0;
        self.placeHolderLabel?.font = self.font;
        self.placeHolderLabel?.backgroundColor = UIColor.clearColor();
        self.placeHolderLabel?.textColor = kPlaceHolderTextColor;
        self.placeHolderLabel?.alpha = 0.0;
        addSubview(self.placeHolderLabel!);
        
        self.letterCountLabel = UILabel();
        self.letterCountLabel?.font = kLetterCountFont;
        self.letterCountLabel?.backgroundColor = UIColor(white: 0.600, alpha: 1.00);
        self.letterCountLabel?.textColor = kLetterCountColor;
        self.letterCountLabel?.layer.cornerRadius = 3.0;
        self.letterCountLabel?.layer.masksToBounds = true;
        self.letterCountLabel?.alpha = 0.0;
        self.letterCountLabel?.textAlignment = .Center;
        addSubview(self.letterCountLabel!);
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer);
        
        initialize();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        initialize();
    }
    
    // MARK: - 视图控制
    
    @objc private func textViewDidChange(notification: NSNotification) {
        
        self.refreshPlaceholder();
        
        if self.limitContentLength! {
            
            let textView = notification.object as! UITextView;
            
            let contentStr:String = textView.text
            if contentStr.aj_length > self.maxLetterCount {
                
                textView.text = contentStr.aj_subString(self.maxLetterCount!);
            }
        }
    }
    
    private func refreshPlaceholder() {
        if (self.text.aj_length > 0){
            self.placeHolderLabel?.alpha = 0.0;
            
            let lessLetterCount = self.maxLetterCount! - self.text.aj_length;
            showLetterCount(lessLetterCount);
            
        }else{
            self.placeHolderLabel?.alpha = 1.0;
            
            showLetterCount(self.maxLetterCount!);
        }
    }
    
    private func refreshLetterCount() {
        self.setNeedsLayout();
        self.layoutIfNeeded();
    }
    
    private func showLetterCount(letterCount:NSInteger = 0) {
        self.letterCountLabel?.text = "\(letterCount)";
        
        if (letterCount < 0) {
            self.letterCountLabel?.textColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 0.60);
            
            self.isOverMaxLength = true;
            
        }else{
            self.letterCountLabel?.textColor = kLetterCountColor;
            
            self.isOverMaxLength = false;
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        self.placeHolderLabel?.sizeToFit();
        self.placeHolderLabel?.frame = CGRectMake(kSpaceWidth, kSpaceWidth, CGRectGetWidth(self.frame) - 2 * kSpaceWidth, CGRectGetHeight(self.placeHolderLabel!.frame));
        
        self.letterCountLabel?.sizeToFit();
        let letterCountLabelY = CGRectGetHeight(self.frame) - kSpaceWidth / 2.0 - kLetterCountHeight;
        let letterCountLabelX = CGRectGetWidth(self.frame) - kSpaceWidth / 2.0 - kLetterCountWidth;
        self.letterCountLabel?.frame = CGRectMake(letterCountLabelX, letterCountLabelY , kLetterCountWidth, kLetterCountHeight);
    }
    
    

}
