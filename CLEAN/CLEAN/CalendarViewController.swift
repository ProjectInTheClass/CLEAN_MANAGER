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


class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var selected: [EventInfo] = []
    
    var dateExample = ["2018-06-17", "2018-06-12", "2018-06-29", "2018-06-19"]

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
        
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 450 : 350
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: height))
        
        //calendar.allowsMultipleSelection = true  // 여러날짜 동시선택기능
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = UIColor.white
        
        view.addSubview(calendar)
        self.calendar = calendar
        
    }
    
    // Intended for any operations that you want always to occur before the view becomes visible
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
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
        

        calendar.select(Date.init())
        
       // calendar.reloadData()
        
        
        // calendar.selectedDate 로 선택된 날짜에 따라서 테이블 뷰를 생성하게해야됨???...
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//    해야되는 청소가 적어도 1개 이상이면 해당날짜에 청소아이콘 띄울 수 있게 하기
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
    
        let dateString = self.formatter.string(from: date)
        
        if self.dateExample.contains(dateString) {
            return dateExample.contains(dateString) ? UIImage(named: "exam_Icon") : nil
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selected = EventModel.shared.dataAt(date: date as Date)
        tableView.reloadData()
    }
    
    // 테이블 뷰 (override X)  -> 선택된 날짜(calendar.selecedDate)하고 청소들의 날짜 비교해서 같은 값
    // 들의 개수만큼 행 개수 생성하기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selected.count
    }
    
    // 청소목록에서 선택된날짜와 청소하는 날짜가 같은것들의 청소 목록들 나오게 하기..
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = selected[indexPath.row]
        
    //    cell.textLabel?.text = "Index \(indexPath.row)"
        cell.textLabel?.text = item.memo
        return cell
        
    }
    

    /*
     func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
     return
     }
     
   
 */
    
}
