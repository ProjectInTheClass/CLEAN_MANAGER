//
//  ViewController.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 5. 10..
//  Copyright © 2018년 김장현. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet
    weak var calendar: FSCalendar!
    
    @IBOutlet
    weak var calendarHeightConstraint: NSLayoutConstraint!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

