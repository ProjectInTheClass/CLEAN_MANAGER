//
//  TableViewMain.swift
//  CLEAN
//
//  Created by eunji on 2018. 6. 21..
//  Copyright © 2018년 clean. All rights reserved.
//

import Foundation

import UIKit

class CleanTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var datas:Array<Dictionary<String, Any>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        CleanTableData.shared.data_setting()
        CleanTableData.shared.data_debug()
        //datas = CleanTableData.shared.data.data
        //print(",,,,\ncount: \(datas.count)\n0000000")
        //self.tableview.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CleanTableData.shared.data_setting()
        CleanTableData.shared.data_debug()
        //datas = CleanTableData.shared.data.data
        
        if let dataList:Array<Dictionary<String, Any>> = UserDefaults.standard.object(forKey: Constants.Database.data_name) as? Array<Dictionary<String, Any>> {
            datas = dataList
        }
        
        print(",,,,\ncount: \(datas.count)\n0000000")
        tableview.reloadData()
    }
    
     func viewInit() {
      // tableview.backgroundColor = .white
      // tableview.layer.masksToBounds = false
       tableview.layer.shadowColor = UIColor.black.cgColor
       tableview.layer.shadowOffset = CGSize.zero
       tableview.layer.shadowOpacity = 0.3
       tableview.layer.shadowRadius = 10
    
      return
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }
    
    //테이블뷰 셀 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //        let quanx = datas[indexPath.row]
        //        let image = String(quanx.eid)
        //
        //        cell.textLabel?.text = quanx.ename
        //        cell.detailTextLabel?.text = quanx.front_date
        //        cell.imageView?.image = UIImage(named: image)
        // Configure the cell...
        
        //        getData["memo"] = get_data.memo
        //        getData["valid"] = get_data.valid
        //        getData["front_date"] = get_data.front_date
        //        getData["cycle"] = get_data.cycle
        //        getData["alarm"] = get_data.alarm
        //        getData["eid"] = get_data.eid
        
        
        //수정본
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let infoDic = datas[indexPath.row] as Dictionary<String, Any>
        
        var image = ""
        let eid = infoDic["eid"]
        
        if eid as! Int == 00 {
            image = "sofa"
        } else if eid as! Int == 01 {
            image = "floor2"
        } else if eid as! Int == 10 {
            image = "microwave"
        } else if eid as! Int == 11 {
            image = "floor"
        } else if eid as! Int == 20 {
            image = "bath"
        } else if eid as! Int == 21 {
            image = "basin"
        } else if eid as! Int == 22 {
            image = "floor"
        } else if eid as! Int == 23 {
            image = "toilet"
        } else if eid as! Int == 30 {
            image = "bed"
        } else if eid as! Int == 31 {
            image = "floor2"
        } else if eid as! Int == 40 {
            image = "bed"
        } else if eid as! Int == 41 {
            image = "floor2"
        } else if eid as! Int == 50 {
            image = "bed"
        }else if eid as! Int == 51 {
            image = "floor2"
        } else if eid as! Int == 60 {
            image = "closet"
        } else if eid as! Int == 61 {
            image = "floor2"
        } else if eid as! Int == 70 {
            image = "tv"
        } else if eid as! Int == 71 {
            image = "computer"
        } else if eid as! Int == 72 {
            image = "hairdry"
        }
        
        cell.imgView.image = UIImage(named: image)
        cell.lblTitle.text = infoDic["ename"] as? String
        cell.lblDays.text = infoDic["front_date"] as? String
        
        
        return cell
    }
    
    
}
