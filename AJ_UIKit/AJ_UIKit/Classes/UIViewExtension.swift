//
//  UIViewExtension.swift
//  AJ_UIKit
//
//  Created by 钟宝健 on 16/4/11.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

extension UIView {
    
    var aj_x:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.origin.x = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.origin.x;
        }
    }
    
    var aj_y:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.origin.y = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.origin.y;
        }
    }
    
    var aj_width:CGFloat {
        
        set{
            var changeFrame:CGRect = self.frame;
            changeFrame.size.width = newValue;
            self.frame = changeFrame;
        }
        
        get{
            return self.frame.size.width;
        }
    }
    
    var aj_height:CGFloat {
        
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
            return self.aj_x + self.aj_width;
        }
    }
    
    var bottom:CGFloat {
        get{
            return self.aj_y + self.aj_height;
        }
    }
    
}
