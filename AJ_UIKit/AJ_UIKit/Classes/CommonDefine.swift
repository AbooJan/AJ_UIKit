//
//  CommonDefine.swift
//  AJ_UIKit
//
//  Created by aboojan on 16/4/10.
//  Copyright © 2016年 aboojan. All rights reserved.
//

import UIKit

class CommonDefine: NSObject {
    
    final let CORNER_RADIUS:CGFloat = 5.0;
    
    func imageName(name: String) -> String? {
        if (!name.isEmpty) {
            let path = "AJ_UIKit_Resource.bundle/\(name)";
            return path;
        }else{
            return nil;
        }
    }
    
}
