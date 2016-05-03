//
//  UIView+ColorfulSubviews.swift
//  RuntimeSubclassing
//
//  Created by Ross LeBeau on 5/2/16.
//  Copyright © 2016 Ross LeBeau. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIView.self {
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = #selector(UIView.layoutSubviews)
            let swizzledSelector = #selector(UIView.rfl_layoutSubviewsWithColor)
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }
    
    // MARK: - Method Swizzling
    
    func rfl_layoutSubviewsWithColor() {
        self.rfl_layoutSubviewsWithColor()
        print("laying out subviews TWO 2")
    }
}
