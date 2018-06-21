//
//  DetailSetData.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 6..
//  Copyright © 2018년 김장현. All rights reserved.
//
import Foundation

class EventData {
    var database_path : String
    var file_mgr : FileManager
    var dir_path : [String]
    var docs_dir : String
    init ()
    {
        self.database_path = String()
        self.file_mgr = FileManager.default
        self.dir_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        self.docs_dir = self.dir_path[0]
        self.database_path = docs_dir.appending(Constants.Database.db_name)
    }
    
    func create_table()
    {
        var i = 0
        var datas : [EventInfo] = []

        if !self.file_mgr.fileExists(atPath: self.database_path){
            let contactDB = FMDatabase(path: self.database_path)
            
            if contactDB.open(){
                let sql_create_table = Constants.DB_event.sql_etable_create
                
                if !contactDB.executeStatements(sql_create_table){
                    print("Error0: contactDB execute Fail, \(contactDB.lastError())")
                }
                contactDB.close()
                
                datas.append(EventInfo(valid: 0, eid: 0, sid: 0, ename: "쇼파", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 1, sid: 0, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                datas.append(EventInfo(valid: 0, eid: 10, sid: 1, ename: "전자레인지", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 11, sid: 1, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                
                datas.append(EventInfo(valid: 0, eid: 20, sid: 2, ename: "욕실", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 21, sid: 2, ename: "세면대", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 22, sid: 2, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 23, sid: 2, ename: "변기", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                datas.append(EventInfo(valid: 0, eid: 30, sid: 3, ename: "침대", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 31, sid: 3, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                datas.append(EventInfo(valid: 0, eid: 40, sid: 4, ename: "침대", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 41, sid: 4, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                datas.append(EventInfo(valid: 0, eid: 50, sid: 5, ename: "침대", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 51, sid: 5, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                datas.append(EventInfo(valid: 0, eid: 60, sid: 6, ename: "옷장", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 61, sid: 6, ename: "바닥", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                
                datas.append(EventInfo(valid: 0, eid: 70, sid: 7, ename: "TV", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 71, sid: 7, ename: "컴퓨터", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                datas.append(EventInfo(valid: 0, eid: 72, sid: 7, ename: "드라이기", front_date: "", cycle: "0/0", alarm: 0, memo: ""))
                print("sizeof datas" + String(datas.count))
                
                
                
                while(i < datas.count){
                    insert_event(get_data: datas[i])
                    i+=1
                }

            } else {
                print("ERROR1: contactDB open fail, \(contactDB.lastError())")
            }
        } else {
            print("DB is exist")
        }
    }
    
    
    func find_event(event_id: Int, get_data: EventInfo)
    {
        let contactDB = FMDatabase(path: self.database_path)
        if contactDB.open() {
            let sql_select = Constants.DB_event.sql_set_detail + "\(event_id)"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                if result.next(){
                    get_data.valid = result.long(forColumnIndex: 0)
                    get_data.eid = result.long(forColumnIndex: 1)
                    get_data.sid = result.long(forColumnIndex: 2)
                    get_data.ename = result.string(forColumnIndex: 3)!
                    get_data.front_date = result.string(forColumnIndex: 4)!
                    get_data.cycle = result.string(forColumnIndex: 5)!
                    get_data.alarm = result.long(forColumnIndex: 6)
                    get_data.memo = result.string(forColumnIndex: 7)!
                    //get_data.set_init(valid: result.long(forColumnIndex: 0), eid: result.long(forColumnIndex: 1), sid: result.long(forColumnIndex: 2), ename: result.string(forColumnIndex: 3)!, front_date: result.string(forColumnIndex: 4)!, cycle: result.string(forColumnIndex: 5)!, alarm: result.long(forColumnIndex: 6), memo: result.string(forColumnIndex: 7)!)
//                  get_data.front_date =
//                    phone.text = result.string(forColumn: "AGE")
//                    resultLabel.text = "\(result.string(forColumn: "NAME")!) find!"
                } else {
                    print("panic: (\(event_id)) detail set not found!!")
                    exit(0)
//                    name.text = ""
//                    phone.text = ""
//                    resultLabel.text = "Record is not found"
                }
            } catch {
                print("error")
            }
            contactDB.close()
        } else {
            print("else error")
        }
    }
    
    func find_all_event(get_datas: EventNames){
        let contactDB = FMDatabase(path: self.database_path)
        
        if contactDB.open() {
            let sql_select = "SELECT VALID, EID, ENAME, FRONTDATE FROM EVENT ORDER BY FRONTDATE"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                while(result.next()){
                    let get_data = EventName()
                    get_data.set_init(valid: result.long(forColumnIndex: 0), eid: result.long(forColumnIndex: 1), ename: result.string(forColumnIndex: 2)!, front_date: result.string(forColumnIndex: 3)!)
                    print("debug: eid" + String(result.long(forColumnIndex: 1)))
                    get_datas.data.append(get_data)
                    get_datas.count+=1
                }
            } catch {
                print("error")
            }
            contactDB.close()
        } else {
            print("else error")
        }

    }
    
    
    func find_events(space_id: Int, get_datas: EventNames){
        let contactDB = FMDatabase(path: self.database_path)
        let get_data = EventName()
        if contactDB.open() {
            let sql_select = Constants.DB_event.sql_collections + "\(space_id)"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                while(result.next()){
                    get_data.set_init(valid: result.long(forColumnIndex: 0), eid: result.long(forColumnIndex: 1), ename: result.string(forColumnIndex: 2)!, front_date: result.string(forColumnIndex: 3)!)
                    get_datas.data.append(get_data)
                    get_datas.count+=1
                }
            } catch {
                print("error")
            }
            contactDB.close()
        } else {
            print("else error")
        }
    }
    
    func insert_event(get_data: EventInfo){
        let contactDB = FMDatabase(path: self.database_path)
        if contactDB.open(){
            let insertSQL =  Constants.DB_event.sql_event_insert + "(\(get_data.valid), \(get_data.eid), \(get_data.sid), '\(get_data.ename)', '\(get_data.front_date)', '\(get_data.cycle)', '\(get_data.alarm)', '\(get_data.memo)')"

            print(insertSQL)
            let result = contactDB.executeUpdate(insertSQL, withArgumentsIn: [])
            if !result{
                print("panic: insert error")
                exit(0)
            } else {
                print("insert success")
            }
        }else {
            print("Error3: contactDB open Fail, \(contactDB.lastError())")
        }
    }
    
   
    
    func undate_event(get_data: EventInfo) {
        let contactDB = FMDatabase(path: self.database_path)
        if contactDB.open() {
            let updateSQL = Constants.DB_event.sql_event_update + "VALID=\(get_data.valid), FRONTDATE='\(get_data.front_date)', CYCLE='\(get_data.cycle)', ALARM=\(get_data.alarm), MEMO='\(get_data.memo)'" + "WHERE EID = \(get_data.eid)"
            let result = contactDB.executeUpdate(updateSQL, withArgumentsIn: [])
            if !result{
                print("panic: update error")
                exit(0)
            } else {
                print("update success")
            }
        }else {
            print("Error3: contactDB open Fail, \(contactDB.lastError())")
        }
    }
    
    func debug()
    {
        let contactDB = FMDatabase(path: self.database_path)
        if contactDB.open() {
            let sql_select = "SELECT * FROM EVENT ORDER BY EID"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                while(result.next()){
                    print("\n\n******************\nvalid: \(result.long(forColumnIndex: 0))eid: \(result.long(forColumnIndex: 1))\nsid: \(result.long(forColumnIndex: 2))\nename: \(result.string(forColumnIndex: 3)!))\nfront_date: \(result.string(forColumnIndex: 4)!)\ncycle: \(result.string(forColumnIndex: 5)!)\nalarm: \(result.long(forColumnIndex: 6))\nmemo: \(result.string(forColumnIndex: 7)!)\n**********************\n\n")
                    //                  get_data.front_date =
                    //                    phone.text = result.string(forColumn: "AGE")
                    //                    resultLabel.text = "\(result.string(forColumn: "NAME")!) find!"
            }
            } catch {
                print("error")
            }
            contactDB.close()
        } else {
            print("else error")
        }
    }
}
