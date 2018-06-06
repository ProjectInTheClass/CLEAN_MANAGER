//
//  DetailSetData.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 6..
//  Copyright © 2018년 김장현. All rights reserved.
//
import Foundation

class DetailSet {
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
                let sql_create_table = Constants.Database.create_exists
                
                if !contactDB.executeStatements(sql_create_table){
                    print("Error0: contactDB execute Fail, \(contactDB.lastError())")
                }
                contactDB.close()
            } else {
                print("ERROR1: contactDB open fail, \(contactDB.lastError())")
            }
        } else {
            print("contactDB is exist")
        }
    }
    func find_event(event_id: Int)
    {
        let contactDB = FMDatabase(path: self.database_path)
        if contactDB.open() {
            let sql_select = Constants.DB_event.SQL_set_detail + "\(event_id)"
            print(sql_select)
            do {
                let result = try contactDB.executeQuery(sql_select, values: [])
                if result.next(){
//                    phone.text = result.string(forColumn: "AGE")
//                    resultLabel.text = "\(result.string(forColumn: "NAME")!) find!"
                } else {
//                    name.text = ""
//                    phone.text = ""
//                    resultLabel.text = "Record is not found"
                }
            } catch {
                print("error")
            }
        } else {
            print("else error")
        }
    }
}
