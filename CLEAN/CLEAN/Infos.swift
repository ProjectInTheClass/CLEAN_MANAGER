//
//  Class.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 6..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation

class EventInfo {
    var eid : Int
    var sid : Int
    var ename : String
    var front_date : String
    var cycle : String
    var alarm : Int
    var memo : String
    
    init(eid: Int, sid: Int, ename: String, front_date: String, cycle: String, alarm: Int, memo: String) {
        self.eid = eid
        self.sid = sid
        self.ename = ename
        self.front_date = front_date
        self.cycle = cycle
        self.alarm = alarm
        self.memo = memo
    }
    
    func set_init(eid: Int,sid: Int, ename: String, front_date: String, cycle: String, alarm: Int, memo: String) {
        self.eid = eid
        self.sid = sid
        self.ename = ename
        self.front_date = front_date
        self.cycle = cycle
        self.alarm = alarm
        self.memo = memo
    }
    
    func set_sid(sid: Int){
        self.sid = sid
    }
    func set_ename(ename: String){
        self.ename = ename
    }
    func set_front_date(front_date: String){
        self.front_date = front_date
    }
    func set_cycle(cycle: String){
        self.cycle = cycle
    }
    func set_alarm(alarm: Int){
        self.alarm = alarm
    }
    func set_memo(memo: String){
        self.memo = memo
    }
    func debug() {
        print("event info: eid: \(self.eid)  sid: \(self.sid)  ename: \(self.ename)  front_date: \(self.front_date)    cycle: \(self.cycle)   alarm: \(self.alarm)    memo: \(self.memo)")
    }
}

class EventName {
    var eid : Int = 0
    var ename : String = ""
    var front_date : String = ""
    
    func set_init(eid: Int, ename: String, front_date: String){
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
