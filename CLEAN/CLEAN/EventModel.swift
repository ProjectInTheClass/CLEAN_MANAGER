//
//  EventModel.swift
//  CLEAN
//
//  Created by admin on 2018. 6. 17..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation

class EventModel {
    // 객체를 한개로 해주기위해서..
    static let shared = EventModel()
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



struct EventDetail {
    var event: EventInfo!
    var date: Date
}

// 2018.06 ~ 2018.12  달을 기준으로? 위에 data에서 시작날짜와 cycle에따라서 이벤트를 다 만들어준다
// bath가 1주에 한번하는거면 해당달에 4개의 이벤트를 만들어주고 그걸 테이블뷰에 보여주게하는 방식으로..
//    func event(from: Date, to: Date) -> [EventDetail] {
//        for i in data {
//
//        }
//    }
