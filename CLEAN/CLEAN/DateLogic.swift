//
//  DateLogic.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 20..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation

class DateLogic {
    var front_date : String
    var cycle : String
    
    init(front_date: String, cycle: String) {
        self.front_date =  front_date
        self.cycle = cycle
    }
    
    func cycle_to_int() -> Int {
        //cycle parsing
        //cycle to double
        let parts = cycle.components(separatedBy: "/")
        let days: Int = Int(parts[0])! * 7 + Int(parts[1])!
        return days
    }
    
    func getToday(format: String = "yyyy-MM-dd") -> String {
        let now = Date()
        let formmater = DateFormatter()
        formmater.dateFormat = format
        return formmater.string(from: now as Date)
    }
    
    func getSomeWeekDate(day:Int) -> String {
        let now = Date()
        let resultDate: Date
        let formmater = DateFormatter()
        
        if day > 0 {
            resultDate = Date(timeInterval: 86400.0 * Double(day), since: now as Date)
            formmater.dateFormat = "yyyy-MM-dd"
            return formmater.string(from: resultDate as Date)
        } else {
            return "-1"
        }
    }
    
    func init_front_date() {
        let now = getToday()
        let days = cycle_to_int()
        while(now < front_date) {
            self.front_date = getSomeWeekDate(day: days)
            if  self.front_date == "-1" {
                print("get some week date error")
                exit(0)
            }
        }
    }
    
    func next_front_date(cycle: String) {
        let days = cycle_to_int()
        self.front_date = getSomeWeekDate(day: days)
    }
}
