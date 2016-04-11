//
//  UIViewExtension.swift
//  AJ_UIKit
//
//  Created by 钟宝健 on 16/4/11.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

extension UIView {
    
    var x:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.origin.x = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.origin.x;
        }
    }
    
    var y:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.origin.y = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.origin.y;
        }
    }
    
    var width:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.size.width = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.size.width;
        }
    }
    
    var height:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.size.height = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.size.height;
        }
    }
    
    var right:CGFloat {
        get{
            return self.x + self.width;
        }
    }
    
    var bottom:CGFloat {
        get{
            return self.y + self.height;
        }
    }
    
}
