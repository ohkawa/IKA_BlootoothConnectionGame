//
//  UIImage+PixcelColor.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import UIKit

let pixcelDataByteSize = 4

extension UIImage {
    
    func getColor(pos: CGPoint) -> UIColor {
        
        let imageData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage))
        let data : UnsafePointer = CFDataGetBytePtr(imageData)
        let scale = UIScreen.mainScreen().scale
        let address : Int = ((Int(self.size.width) * Int(pos.y * scale)) + Int(pos.x * scale)) * pixcelDataByteSize
        let r = CGFloat(data[address])
        let g = CGFloat(data[address+1])
        let b = CGFloat(data[address+2])
        let a = CGFloat(data[address+3])
        
        // for debug.
        print(r, g, b, a)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}