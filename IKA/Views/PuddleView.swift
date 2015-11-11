//
//  PuddleView.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import UIKit

let defaultScale = CGAffineTransformMakeScale(10, 10)

class PuddleView : UIView {
    
    var point : PointModel? {
        didSet {
            self.backgroundColor = self.point!.color
            self.center = self.point!.point
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(point: PointModel) {
        self.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.layer.cornerRadius = 50 / 2.0
        self.preparation(point)
    }
    func preparation(point: PointModel) {
        self.point = point
    }
    func spread() {
        
        UIView.animateWithDuration(2.5, // アニメーションの時間
            delay: 0.0,  // アニメーションの遅延時間
            usingSpringWithDamping: 0.5, // スプリングの効果(0..1)
            initialSpringVelocity: 0.5,  // バネの初速。(0..1)
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {() -> Void  in
                self.transform = CGAffineTransformMakeScale(self.point!.scale,
                    self.point!.scale)
//                self.layer.removeAllAnimations()
            },
            completion: {(finished: Bool) -> Void in
        })
        
    }

}




    