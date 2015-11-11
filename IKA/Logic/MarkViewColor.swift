//
//  Mark.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import UIKit

let margin : CGFloat = 50

public func mark(view: UIView) {
    let image = view.toImage()

    for (var y = margin; y < image!.size.height; y += margin) {
        for (var x = margin; x < image!.size.width; x += margin) {
            _ = image?.getColor(CGPointMake(x, y))

#if DEBUG
            let dot = UIView(frame: CGRectMake(0, 0, 2, 2))
            dot.center = CGPointMake(x, y)
            dot.backgroundColor = UIColor.blueColor()
            view.addSubview(dot)
#endif
        }
    }
}

