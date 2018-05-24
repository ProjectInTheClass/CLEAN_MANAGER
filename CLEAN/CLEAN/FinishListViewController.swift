//
//  FinishListViewController.swift
//  CLEAN
//
//  Created by eunji on 2018. 5. 21..
//  Copyright © 2018년 eunji. All rights reserved.
//

import UIKit

class FinishListViewController: UIViewController {

    @IBOutlet weak var segmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmented.setBackgroundImage(#imageLiteral(resourceName: "selectedSeg"), for: .selected, barMetrics: .default)
        segmented.setBackgroundImage(#imageLiteral(resourceName: "unselectedSeg"), for: .normal, barMetrics: .default)
        segmented.setBackgroundImage(#imageLiteral(resourceName: "selectedSeg"), for: .reserved, barMetrics: .default)
        segmented.setDividerImage(#imageLiteral(resourceName: "unselectedSeg"), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmented.setDividerImage(#imageLiteral(resourceName: "unselectedSeg"), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        segmented.setDividerImage(#imageLiteral(resourceName: "unselectedSeg"), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
