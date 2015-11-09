//
//  Message.swift
//  IKA
//
//  Created by Maiko Ohkawa on 11/8/15.
//  Copyright © 2015 Maiko Ohkawa. All rights reserved.
//

import Foundation

enum MessageType : Int32  {
    case GameStatus
}

let MESSAGE_TYPE = "MessageType"

class Message: NSObject, NSCoding {
    var messageType : MessageType = MessageType.GameStatus
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInt32(self.messageType.rawValue, forKey: MESSAGE_TYPE)
    }
    
    required init(coder aDecoder: NSCoder) {
        let type = aDecoder.decodeObjectForKey(MESSAGE_TYPE) as! Int32
        self.messageType = MessageType(rawValue: type)!
    }
}


