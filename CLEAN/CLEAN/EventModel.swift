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
    
    let formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "yyyy-MM-dd"
    }
    
     // detail에서 추가했을때 data에 추가되게하기 , 특정 날짜가아닌 요일로해야할듯??
    var data = [
        EventInfo(eid: 1,sid: 1,ename: "bath",front_date: "2018-06-17",cycle: "3/1",alarm: 1,memo: "clean Bathroom"),
        EventInfo(eid: 2,sid: 2,ename: "oven",front_date: "2018-06-12",cycle: "4/1",alarm: 1,memo: "clean Oven"),
        EventInfo(eid: 3,sid: 3,ename: "floor",front_date: "2018-06-29",cycle: "0/1",alarm: 1,memo: "clean Floor"),
        EventInfo(eid: 4,sid: 4,ename: "window",front_date: "2018-06-17",cycle: "1/0",alarm: 1,memo: "clean Window")
    ]
    
    func dataAt(date: Date) -> [EventInfo] {
        let target = formatter.string(from: date)
        return data.filter { (info) -> Bool in
            return info.front_date == target
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
