//
//  spaceTable.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 5. 28..
//  Copyright © 2018년 김장현. All rights reserved.
//


import Foundation


// 청소해야될 모든 물건들 있으면 추가하기
enum CleanObjects {
    
    // 공통적인것
    case floor
    case mirror
    case window
    
    // 부엌
    case frige
    case oven
    case laundry
    
    // 침실
    case mattress
    case pillow
    
    // 화장실
    case toilet
    
    // 기타?
    case electronics
    
}

struct Clean {
    var name:String
    var place:Int       //place 값에 따라 알맞은 사진넣기?
    
    init(name:String, place:Int) {
        self.name = name
        self.place = place
    }
}

let cleanArray = [
    CleanObjects.floor: Clean(name: "바닥", place: 0),
    CleanObjects.mirror: Clean(name: "거울", place: 0),
    CleanObjects.window: Clean(name: "창문", place: 0),
    
    CleanObjects.frige: Clean(name: "냉장고", place: 1),
    CleanObjects.oven: Clean(name: "오븐", place: 1),
    CleanObjects.laundry: Clean(name: "세탁기", place: 1),
    
    CleanObjects.mattress: Clean(name: "매트리스", place: 2),
    CleanObjects.pillow: Clean(name: "베개", place: 2),
    
    CleanObjects.toilet: Clean(name: "변기", place: 3),
    
    CleanObjects.electronics: Clean(name: "전자제품", place: 4)
    
]

class Cleaning {
    var clean:Clean
    
    var startDate:Date
    var dueDate:Date
    var cycle:Int
    
    init(clean:Clean, startDate:Date, dueDate:Date, cycle:Int){
        self.clean = clean
        self.startDate = startDate
        self.dueDate = dueDate
        self.cycle = cycle
        
    }
    
}




