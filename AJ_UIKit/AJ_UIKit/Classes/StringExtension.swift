//
//  StringExtension.swift
//  AJ_UIKit
//
//  Created by 钟宝健 on 16/4/12.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import Foundation

extension String{
    
    var aj_length:NSInteger {
        
        get{
            return self.characters.count;
        }
    }
    
    func aj_subString(toIndex:NSInteger) -> String {
        let endIndex = self.startIndex.advancedBy(toIndex);
        let subStr = self.substringToIndex(endIndex);
        
        return subStr;
    }
}