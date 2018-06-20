//
//  Class.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 6..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation

class EventInfo {
    var valid : Int
    var eid : Int
    var sid : Int
    var ename : String
    var front_date : String
    var cycle : String
    var alarm : Int
    var memo : String
    
    init(valid: Int, eid: Int, sid: Int, ename: String, front_date: String, cycle: String, alarm: Int, memo: String) {
        self.valid = valid
        self.eid = eid
        self.sid = sid
        self.ename = ename
        self.front_date = front_date
        self.cycle = cycle
        self.alarm = alarm
        self.memo = memo
    }
    
    func set_init(valid: Int, eid: Int, sid: Int, ename: String, front_date: String, cycle: String, alarm: Int, memo: String) {
        self.valid = valid
        self.eid = eid
        self.sid = sid
        self.ename = ename
        self.front_date = front_date
        self.cycle = cycle
        self.alarm = alarm
        self.memo = memo
    }
    
    func debug() {
        print("event info: valid: \(self.valid) eid: \(self.eid)  sid: \(self.sid)  ename: \(self.ename)  front_date: \(self.front_date)    cycle: \(self.cycle)   alarm: \(self.alarm)    memo: \(self.memo)")
    }
}

class EventName {
    var eid : Int = 0
    var ename : String = ""
    var front_date : String = ""
    
    func set_init(valid: Int, eid: Int, ename: String, front_date: String){
        self.eid = eid
        self.ename = ename
        self.front_date = front_date
    }
}

class EventNames {
    var data : [EventName]
    var count : Int
    
    init(){
        data = Array<EventName>()
        count = 0
    }
}
