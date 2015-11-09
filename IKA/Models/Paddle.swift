//
//  Puddle.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit


let KEY_POINT = "point"
let KEY_X     = "x"
let KEY_Y     = "y"
let KEY_SCALE = "scale"
let KEY_COLOR = "color"

class PointModel: NSObject, NSCoding {
    var point : CGPoint = CGPointZero
    var scale : CGFloat = 1
    var color : UIColor? = nil
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.point.x, forKey: KEY_X)
        aCoder.encodeObject(self.point.y, forKey: KEY_Y)
        aCoder.encodeObject(self.scale, forKey: KEY_SCALE)
        aCoder.encodeObject(self.color, forKey: KEY_COLOR)
    }
    
    required init(coder aDecoder: NSCoder) {
        let x = aDecoder.decodeObjectForKey(KEY_X) as! CGFloat
        let y = aDecoder.decodeObjectForKey(KEY_Y) as! CGFloat
        self.point = CGPointMake(x, y)
        self.scale = aDecoder.decodeObjectForKey(KEY_SCALE) as! CGFloat
        self.color = (aDecoder.decodeObjectForKey(KEY_COLOR) as! UIColor)
    }
    
}