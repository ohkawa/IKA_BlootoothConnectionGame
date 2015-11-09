//
//  Timer.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import Foundation

let LIMIT_TIME = 1000

class Timer : NSObject {
    var repeater: NSTimer! = nil
    let interval = 0.01
    var limit: Int = LIMIT_TIME

    func start() {
        limit = LIMIT_TIME
        self.repeater = createRepeter()
    }
    
    func pause() {
        self.repeater.invalidate()
    }
    
    func unpause() {
        self.repeater = createRepeter()
    }
    
    func update(timer : NSTimer) {
        print(--limit)
        if limit <= 0 {
            self.repeater.invalidate()
            fire()
        }
    }
    
    func fire(){
    }
    
    func createRepeter() -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(self.interval, target: self, selector: Selector("update:"), userInfo: nil, repeats: true)
    }
}
