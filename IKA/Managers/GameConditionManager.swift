//
//  GameConditionManager.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import Foundation

enum Condition {
    case NotStarted                // ユーザが Start ボタン未押下
    case WaitForOpponentToTapStart // 対戦相手の Start ボタン押下待ち
}

class GameConditionManager : NSObject {

    static let sharedInstance = GameConditionManager()


    var condition = Condition.NotStarted

    func initialize() {
    }
}




