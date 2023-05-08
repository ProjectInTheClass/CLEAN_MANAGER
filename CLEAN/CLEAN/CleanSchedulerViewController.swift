//
//  CleanSchedulerViewController.swift
//  CLEAN
//
//  Created by eunji on 2018. 6. 21..
//  Copyright © 2018년 김장현. All rights reserved.
//
//
//import UIKit
//
//class CleanSchedulerViewController: UITableViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var titleLabel: UILabel!
//    
//    var datas: [EventName] = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        title = ""
//        
//        
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        CleanTableData.shared.data_setting()
//        CleanTableData.shared.data_debug()
//        datas = CleanTableData.shared.data.data
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return datas.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
//        let quanx = datas[indexPath.row]
//        let image = quanx.eid
//        
//        cell.textLabel?.text = quanx.ename
//        cell.imageView?.image = UIImage(named: String(image) )
//        return cell
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
