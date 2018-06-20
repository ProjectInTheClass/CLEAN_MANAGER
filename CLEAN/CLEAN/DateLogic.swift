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
        
    func cycle_to_double() {
        //cycle parsing
        //cycle to double
    }
    
    func getToday(format: String = "yyyy-MM-dd") -> String {
        let now = Date()
        let formmater = DateFormatter()
        formmater.dateFormat = format
        return formmater.string(from: now as Date)
    }
    
    func getSomeWeekDate(week: Double) -> String {
        let now = Date()
        let resultDate: Date
        let formmater = DateFormatter()
        
        if week > 0 {
            resultDate = Date(timeInterval: 604800 * week, since: now as Date)
        } else {
            resultDate = Date(timeInterval: -604800 * fabs(week), since: now as Date)
        }

        formmater.dateFormat = "yyyy-MM-dd"
        return formmater.string(from: resultDate as Date)
    }
    
    func init_front_date(front_date: String, cycle: String) -> String {
        
    }
    
    func next_front_date(cycle: String) -> String {
        var today = getToday()
        
    }
}
