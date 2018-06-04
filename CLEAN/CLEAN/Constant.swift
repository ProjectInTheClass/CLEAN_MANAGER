//
//  Constant.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 5. 28..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation
import UIKit

class Constants: NSObject{
    
    struct Database{
        static let dbPath = NSString()
    }
    struct DetailSet {
        static let alarm_data = ["소리", "진동", "무음"]
        static let month = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"]
        static let day = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
        static let memo_place_holder = "memo..."
        static let date_format = "MMMM - dd - YYYY"
        static let alarm_picker_num = 1
        static let cycle_picker_num = 2
    }
    struct TextShow{
        static let space_holder_color : UIColor = UIColor.lightGray
        static let text_color : UIColor = UIColor.black
    }
    struct Button{
        static let done = "done"
    }
}
