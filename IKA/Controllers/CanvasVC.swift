//
//  CanvasVC.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import UIKit

class CanvasVC: UIViewController {
    
    
    
    var moveView: UIView!
    let timer = Timer()

    override func viewDidLoad() {

        


        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer.start()
        
        NearbyManager.sharedInstance.canvasVC = self

        self.view.multipleTouchEnabled = true
    }
    
    
    var beginTime: NSTimeInterval = 0.0
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        beginTime = NSDate.timeIntervalSinceReferenceDate()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let longPressTime = NSDate.timeIntervalSinceReferenceDate() - beginTime
        var scale = CGFloat(longPressTime * 10)
        if scale < 4 {
            scale = 4
        }
        let point = PointModel()
        point.point = touches.first!.locationInView(self.view)
        point.scale = scale
        print(scale)
        
        NearbyManager.sharedInstance.sendMessage(point)
        
        let puddle = PuddleView(point: point)
        self.view.addSubview(puddle)
        
        puddle.spread()
    }
    
    func start(point: PointModel) {
    }
    
    func paintEnemyPuddle(point: PointModel) {
        let puddle = PuddleView(point: point)
        puddle.backgroundColor = UIColor.blueColor()
        self.view.addSubview(puddle)
        puddle.spread()
    }
    
}