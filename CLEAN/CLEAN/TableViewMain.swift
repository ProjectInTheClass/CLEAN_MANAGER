//
//  TableViewMain.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 21..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation


import UIKit

class CleanTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var datas: [EventName] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        CleanTableData.shared.data_setting()
        CleanTableData.shared.data_debug()
        datas = CleanTableData.shared.data.data
        print(",,,,\ncount: \(datas.count)\n0000000")
        self.tableview.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CleanTableData.shared.data_setting()
        CleanTableData.shared.data_debug()
        datas = CleanTableData.shared.data.data
        print(",,,,\ncount: \(datas.count)\n0000000")
        tableview.reloadData()
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let quanx = datas[indexPath.row]
        let image = String(quanx.eid)
        
        cell.textLabel?.text = quanx.ename
        cell.detailTextLabel?.text = quanx.front_date
        cell.imageView?.image = UIImage(named: image)
        // Configure the cell...
        
        return cell
    }
    
    
}
