//
//  GameConditionManager.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import Foundation
import UIKit

enum Condition {
    case NotStarted                // ユーザが Start ボタン未押下
    case WaitForOpponentToTapStart // 対戦相手の Start ボタン押下待ち
}

public class GameConditionManager : NSObject {

    static let sharedInstance = GameConditionManager()
    var condition = Condition.NotStarted
    var color : UIColor? = nil

    
    // Temporary Identifier
    public let uuid = NSUUID().UUIDString
    
    public var opponentUuid : String? {
        didSet {
            self.color = (self.opponentUuid < self.uuid) ? UIColor.orangeColor() : UIColor.blueColor()
        }
    }

    func initialize() {
    }
}




