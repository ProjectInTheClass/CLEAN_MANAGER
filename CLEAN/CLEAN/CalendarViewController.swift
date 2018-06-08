//
//  CalendarController.swift
//  CLEAN
//
//  Created by admin on 2018. 5. 31..
//  Copyright © 2018년 이인희. All rights reserved.
//

import Foundation
import FSCalendar
import UIKit


class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    //   @IBOutlet weak var calendar: FSCalendar!
    
    private weak var calendar: FSCalendar!
    
    
    // Called when the view controller’s content view (the top of its view hierarchy) is created and loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calendar"
    }
    
    // Intended for any operations that you want always to occur before the view becomes visible
    override func viewWillAppear(_ animated: Bool) {
        calendar.calendarHeaderView.backgroundColor = UIColor.white
        calendar.calendarWeekdayView.backgroundColor = UIColor.white
        
        calendar.appearance.eventSelectionColor = UIColor.white
        calendar.appearance.headerDateFormat = "yyyy년 M월";
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0;
        calendar.appearance.titleWeekendColor = UIColor.red
    
        
        calendar.appearance.eventOffset = CGPoint(x: 10, y: -7)
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "cell")
        
        calendar.appearance.todayColor = UIColor.lightGray
        calendar.appearance.borderSelectionColor = UIColor.orange
        calendar.appearance.selectionColor = UIColor.white
        
        calendar.appearance.titleSelectionColor = UIColor.black
        
        // calendar.today = nil
        calendar.select(Date.init())
        
        calendar.reloadData()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
    
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.groupTableViewBackground
        self.view = view
        
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 450 : 350
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: height))
        
        //calendar.allowsMultipleSelection = true  // 여러날짜 동시선택기능
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = UIColor.white
        
        view.addSubview(calendar)
        self.calendar = calendar
        
        
    }
    
    
    /*
     func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
     return
     }
     
     // 각 날짜에 특정 문자열이나 이미지 표시할때 이부분 이용
     func calendar(calendar: FSCalendar, subtitleFordate date: NSDate) -> String? {
     return "A"
     }
     
     // 특정 날짜를 선택했을 때 발생하는 이벤트를 처리하는 곳
     func calendar(calendar: FSCalendar, didSelectDate date: NSDate) {
     print(date)
     }
     */
    
}
