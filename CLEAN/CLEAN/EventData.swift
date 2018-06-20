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
        if !self.file_mgr.fileExists(atPath: self.database_path){
            let contactDB = FMDatabase(path: self.database_path)
            
            if contactDB.open(){
                let sql_create_table = Constants.DB_event.sql_etable_create
                
                if !contactDB.executeStatements(sql_create_table){
                    print("Error0: contactDB execute Fail, \(contactDB.lastError())")
                }
                contactDB.close()
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
                    get_data.set_init(eid: result.long(forColumnIndex: 0), sid: result.long(forColumnIndex: 1), ename: result.string(forColumnIndex: 2)!, front_date: result.string(forColumnIndex: 3)!, cycle: result.string(forColumnIndex: 4)!, alarm: result.long(forColumnIndex: 5), memo: result.string(forColumnIndex: 6)!)
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
            let sql_select = "SELECT EID, ENAME, FRONTDATE FROM EVENT"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                while(result.next()){
                    if result.next(){
                        let get_data = EventName()
                        get_data.set_init(eid: result.long(forColumnIndex: 0), ename: result.string(forColumnIndex: 1)!, front_date: result.string(forColumnIndex: 2)!)
                        print("debug: eid" + String(result.long(forColumnIndex: 0)))
                        get_datas.data.append(get_data)
                        get_datas.count+=1
                    } else {
                        print("panic: (find all event) detail set not found!!")
                        //exit(0)
                    }
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
                    if result.next(){
                        get_data.set_init(eid: result.long(forColumnIndex: 0), ename: result.string(forColumnIndex: 1)!, front_date: result.string(forColumnIndex: 2)!)
                        get_datas.data.append(get_data)
                        get_datas.count+=1
                    } else {
                        print("panic: (\(space_id)) detail set not found!!")
                        exit(0)
                    }
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
            let insertSQL =  Constants.DB_event.sql_event_insert + "(\(get_data.sid), '\(get_data.ename)', '\(get_data.front_date)', '\(get_data.cycle)', '\(get_data.alarm)', '\(get_data.memo)')"

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
            let updateSQL = Constants.DB_event.sql_event_update + "ENAME='\(get_data.ename), FRONTDATE='\(get_data.front_date)', CYCLE='\(get_data.cycle)', ALARM=\(get_data.alarm), MEMO='\(get_data.memo)'" + "WHERE EID = \(get_data.eid)"
            let result = contactDB.executeUpdate(updateSQL, withArgumentsIn: [])
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
    
    func debug()
    {
        let contactDB = FMDatabase(path: self.database_path)
        if contactDB.open() {
            let sql_select = "SELECT * FROM EVENT"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                while(result.next()){
                if result.next(){
                    print("\n\n******************\neid: \(result.long(forColumnIndex: 0))\nsid: \(result.long(forColumnIndex: 1))\nename: \(result.string(forColumnIndex: 2)!))\nfront_date: \(result.string(forColumnIndex: 3)!)\ncycle: \(result.string(forColumnIndex: 3)!)\nalarm: \(result.long(forColumnIndex: 5))\nmemo: \(result.string(forColumnIndex: 5)!)\n**********************\n\n")
                    //                  get_data.front_date =
                    //                    phone.text = result.string(forColumn: "AGE")
                    //                    resultLabel.text = "\(result.string(forColumn: "NAME")!) find!"
                } else {
                    print("panic: (debug) detail set not found!!")
                    //exit(0)
                    //                    name.text = ""
                    //                    phone.text = ""
                    //                    resultLabel.text = "Record is not found"
                }
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
