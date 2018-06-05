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
    
    func create_db()
    {
        if !self.file_mgr.fileExists(atPath: self.database_path){
            let contactDB = FMDatabase(path: self.database_path)
            
            if contactDB.open(){
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS ( ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, AGE INTEGER )"
                if !contactDB.executeStatements(sql_stmt){
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
}
