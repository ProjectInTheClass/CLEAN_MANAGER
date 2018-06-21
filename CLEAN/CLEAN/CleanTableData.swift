//
//  CleanTableData.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 21..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation

class CleanTableData{
    // 객체를 한개로 해주기위해서..
    static let shared = CleanTableData()
    var data = EventNames()
    let formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "yyyy-MM-dd"
    }
    
    func data_setting() {
        let event_data = EventData()
        event_data.find_all_event(get_datas: data)
    }
    
    func dataAt(date: Date) -> [EventName] {
        let target = formatter.string(from: date)
        return data.data.filter { (info) -> Bool in
            return info.front_date == target
        }
    }
    
    func data_debug() {
        var i = 0
        print("count: " + String(data.count))
        while(i < data.count){
            print("i: " + String(i)+"eid: " + String(data.data[i].eid) + "ename: " + data.data[i].ename + "data: " + data.data[i].front_date)
            i += 1
        }
    }
}
