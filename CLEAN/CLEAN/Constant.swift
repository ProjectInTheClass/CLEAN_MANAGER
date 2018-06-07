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
    
    struct Database {
        static let db_name = "test_db1"
        //base table name
        static let interface_te_name = "EVENT"
        //static let interface_ts_name = "SPACE"
        
        static let te_name = interface_te_name + " "
        static let j_te_eid = interface_te_name + "(EID)"
        //static let ts_name = interface_ts_name + " "
        //static let j_ts_sid = interface_ts_name + "(SID)"
        //static let ted_name = "EVENTDETAIL "
        
        
        //join table name 
        //static let inferface_jes_name = "J_ES"
        //static let jened_name = "J_EVENT_ND"
        //static let jes_name = inferface_jes_name + " "
        
        //*************
        //create query
        //*************        
        //common create
        static let create_exists = "CREATE TABLE IF NOT EXISTS "
        
        //base column
        //static let ten_column = "( EID INTEGER PRIMARY KEY AUTOINCREMENT, ENAME TEXT,  )"
        static let te_column = "( EID INTEGER PRIMARY KEY AUTOINCREMENT,SID INTEGER, ENAME TEXT, FRONTDATE TEXT, CYCLE TEXT, ALARM INTEGER, MEMO TEXT )"
        //static let ts_column = "( SID INTEGER PRIMARY KEY AUTOINCREMENT, SNAME TEXT )"
        
        //join column
        //static let jes_column = "( FOREIGN KEY(EID) REFERENCES " + j_te_eid + ", FOREIGN KEY(SID) REFERENCES " + j_ts_sid + ")"
        //base table create
        //static let mkt_event_name = create_exists + ten_name + ten_column
        static let mkt_event = create_exists + te_name + te_column
        //static let mkt_space = create_exists + ts_name + ts_column
        //static let mkt_join_esid = create_exists + jes_name + jes_column
    }
    struct DB_event{
        static let select_ed = "SELECT EID, ENAME, FRONTDATE, CYCLE, ALARM, MEMO "
        static let select_cl = "SELECT EID, ENAME, FRONTDATE "
        static let from_ed = "FROM " + Constants.Database.te_name
        static let condition_eid = "WHERE EID = "
        static let condition_sid = "WHERE SID = "
        
        static let sql_set_detail = select_ed + from_ed + condition_eid
        static let sql_collections = select_cl + from_ed + condition_sid
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
