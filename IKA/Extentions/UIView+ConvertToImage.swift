//
//  UIView+ConvertToImage.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import UIKit

// refer:
// UIViewにUIImageへの変換メソッドを追加する(Swift) - しめ鯖日記
// http://llcc.hatenablog.com/entry/2015/05/09/143511

extension UIView {
    public func toImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 0.0, 0.0)
        self.layer.renderInContext(context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
