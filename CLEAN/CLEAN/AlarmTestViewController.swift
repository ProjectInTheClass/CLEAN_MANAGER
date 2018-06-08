//
//  AlarmTestViewController.swift
//  CLEAN
//
//  Created by admin on 2018. 6. 2..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class AlarmTestViewController: UIViewController {
    @IBOutlet weak var Picker: UIDatePicker!
    
//    private let formatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }()
//    
    
    
    @IBAction func CreateAlarm() {
        CreateNotice()
    }
    
    func CreateNotice() {
        let content = UNMutableNotificationContent()
        content.title = "청소지역(화장실) 해당청소(변기)"
        //content.subtitle = "Too hard"
        content.body = "청소해야돼 or 청소했니?"
        content.sound = UNNotificationSound.default()
        content.badge = 1
        
        content.categoryIdentifier = "selectCategory"
        
        
  //    버튼 클릭 후에 홈으로 나갔을 때 5초뒤에 알람 나오는것, 시간차이를 이용해서 알람내고싶을때 이거 사용
  //    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
      
        
        let date = Picker.date
        
        // let date = 2018-12-06
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,],
                                                          from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        
        let requestIdentifier = "requset Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        //foreground 에서도 작동하기위해 추가한것중하나
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error as Any)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AlarmTestViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge, .sound])
    }
    
    // 알람 눌러서 스크롤내리면 2가지 항목이 나오는데 각각 선택했을때 어떤식으로 처리할지 여기서
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "answerYes":
            let alert1 = UIAlertController(title: "화장실-변기", message: "청소 완료", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert1.addAction(action1)
            present(alert1, animated: true, completion: nil)

        case "answerNo":
            
            let alert2 = UIAlertController(title: "화장실-변기", message: "청소 처리 안됨", preferredStyle: .alert)
            let action2 = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert2.addAction(action2)
            present(alert2, animated: true, completion: nil)
        
        
        default:
            break
        }
        completionHandler()
    }
    
}

